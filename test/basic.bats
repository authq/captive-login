load _common

@test "Unknown command" {
  run hlogin foobar
  assert_error
  assert_usage
  assert_output "foobar"
}

@test "Help command" {
  run hlogin --help
  assert_success
  assert_usage
}
