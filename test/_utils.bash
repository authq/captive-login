#!/usr/bin/env bash

#------------------------------------------------------
# Assertions
#------------------------------------------------------

assert_success() {
    [ $status -eq 0 ]
}

assert_error() {
    [ $status -eq 1 ]
}

assert_contains() {
    [[ "$1" == *"$2"* ]]
}

assert_usage() {
    assert_contains "$output" "Usage: "
}

assert_output() {
    assert_contains "$output" "$1"
}
