.PHONY: build install watch live-render live-http
watch:
	# watchexec --exts slang,cr,yml make live-render
	watchexec --exts slang,cr,yml -r -s SIGINT make live-http

live-render: build
	cat bitsflow.har | ./bin/har-viewer /dev/stdout > index.html

live-http: build
	./bin/har-viewer serve 10000

build:
	shards build -v

install:
	shards build -v --release && mv ./bin/har-viewer /usr/local/bin
