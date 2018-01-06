TESTS=test/*.bats

test: $(TESTS)
	./test/bats/bats test

docker-build: Dockerfile
	docker build -t pooya/clogin .

docker-test: docker-build
	docker run -it --rm pooya/clogin test -x
