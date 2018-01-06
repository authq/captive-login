TESTS=test/clogin.bats
BIN=bin/clogin

test: $(BIN) $(TESTS) 
	./test/bats/bats test

docker: Dockerfile
	docker build -t pooya/clogin .

docker-test: docker-build
	docker run -it --rm pooya/clogin test -x
