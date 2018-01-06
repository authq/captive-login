TESTS=test/clogin.bats
BIN=bin/clogin

install: test $(BIN)
	sudo cp -v bin/clogin /usr/local/bin
	sudo cp -v etc/clogin.conf /usr/local/etc
	hash -r

test: $(BIN) $(TESTS) 
	./test/bats/bats test

docker: Dockerfile
	docker build -t pooya/clogin .

docker-test: docker-build
	docker run -it --rm pooya/clogin test -x
