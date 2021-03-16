all: build copy

build:
	mkdir -p release
	docker build -t cross-hello .

copy:
	docker run --rm \
	       -v "$(shell pwd)/release:/local-release" \
		   cross-hello \
		   sh -c 'cp /release/* /local-release'

.PHONY: all build copy
