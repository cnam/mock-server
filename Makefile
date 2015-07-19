start:
	@docker run -d \
		--name mock-server \
		-v $(CURDIR)/perl/lib:/usr/local/nginx/perl/lib \
		-v $(CURDIR)/nginx:/etc/nginx \
		-p 80:80 \
		cnam/mock-server

test:
	curl $(DOCKER_HOST_IP)/write -XPOST -d '{"request":{"uri":"test/test"}, "response": {"body": {"json":"test-data"}}}'
	curl $(DOCKER_HOST_IP)/write -XPOST -d '{"request":{"uri":"test/new_file"}, "response": {"body": {"json":"new file"}}}'
	curl $(DOCKER_HOST_IP)/test/new_file
	curl $(DOCKER_HOST_IP)/test/test

clean:
	-docker rm -f mock-server

restart: clean start

.PHONY: start test restart  clean
