TESTS=test/*.bats

test: $(TESTS)
	./test/bats/bats test
