FROM alpine:3.2

RUN apk update && \
    apk add make \
        perl \
        perl-dev \
        wget \
        gcc \
        g++ \
        pcre \
        pcre-dev \
	    libstdc++ \
        openssl-dev && \
    wget  http://nginx.org/download/nginx-1.8.0.tar.gz && \
    tar xvfvz nginx-1.8.0.tar.gz && \
    cd  nginx-1.8.0 && \
    ./configure --prefix=/usr/local/nginx \
                --sbin-path=/usr/sbin/nginx \
                --conf-path=/etc/nginx/nginx.conf \ 
                --error-log-path=/var/log/nginx/error.log \
                --http-log-path=/var/log/nginx/access.log \
                --pid-path=/run/nginx.pid \
                --lock-path=/run/lock/subsys/nginx \
                --with-http_perl_module \
                --with-debug && \
    make && \
    make install && \
    apk del wget \
            gcc \
            g++ \
            pcre-dev \
            openssl-dev \
            perl-dev \
            libstdc++ \
            make && \
    rm -rf /var/cache/apk/* && \
    cd / && rm -rf nginx-*
 
CMD ["nginx","-g", "daemon off;"] 
