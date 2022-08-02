image.build:
	docker build . -f ./build/docker/Dockerfile -t fearofcode/phpcov:$(version) --build-arg VERSION=$(version)
image.publish:
	docker buildx build . --push --platform linux/arm/v7,linux/arm64/v8,linux/amd64  --tag fearofcode/phpcov:$(version) -f ./build/docker/Dockerfile --build-arg VERSION=$(version)