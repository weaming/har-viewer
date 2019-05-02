.PHONY: build watch
watch: build
	 cat bitsflow.har | ./bin/har-viewer /dev/stdout > index.html

build:
	shards build -v
