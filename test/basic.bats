load _common

@test "Unknown command" {
  run clogin foobar
  assert_error
  assert_usage
  assert_output "foobar"
}

@test "Help command" {
  run clogin --help
  assert_success
  assert_usage
}
