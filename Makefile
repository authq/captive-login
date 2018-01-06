TESTS=test/*.bats

test: $(TESTS)
	./test/bats/bats test

docker-build: Dockerfile
	docker build -t pooya/hlogin .

docker-check: docker-build
	docker run -it --rm pooya/hlogin check -x
