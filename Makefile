start:
	@docker run -d \
		--name mock-server \
		-p 80:80 \
		cnam/mock-server

test:
	curl $(DOCKER_HOST_IP)/write -XPOST -d '{"request":{"uri":"test"}, "response": {"body": {"json":"test-data"}}}'
	curl $(DOCKER_HOST_IP)/test

clean:
	-docker rm -f mock-server

restart: clean start

.PHONY: start test restart  clean
