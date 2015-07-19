start:
	@docker run -d \
	    --name mock-server \
		-v $(CURDIR)/test/usr/local/nginx/perl/lib:/usr/local/nginx/perl/lib \
		-v $(CURDIR)/test/nginx:/etc/nginx \
		-p 80:80 \
		cnam/mock-server

test:
	curl $(DOCKER_HOST_IP)/write -XPOST -d '{"json":"test-data"}'
	curl $(DOCKER_HOST_IP)/
	curl $(DOCKER_HOST_IP)/other

clean:
	-docker rm -f mock-server

restart: clean start

.PHONY: start test restart  clean