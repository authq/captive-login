SRC = hlogin
TESTS = test/*.bats

test: $(TESTS) $(SRC)
	./test/bats/bats test
