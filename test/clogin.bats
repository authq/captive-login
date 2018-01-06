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

assert_options () {
  assert_output "USERNAME=test_user"
  assert_output "PASSWORD=test_password"
  assert_output "HTTP_CLIENT=test_client"
  assert_output "TEST_URL=test_url"
  assert_output "BASE_URL=test_base"
  assert_output "LOGIN_ENDPOINT=test_login"
  assert_output "LOGOUT_ENDPOINT=test_logout"
  assert_output "ALLOW_EMPTY=1"
}

@test "Using arguments" {
  run clogin printenv \
    --username test_user \
    --password test_password \
    --client   test_client \
    --test-url test_url \
    --base test_base \
    --login-endpoint test_login \
    --logout-endpoint test_logout \
    --allow-empty

  assert_success
  assert_options
}

@test "Using ENV variables" {
  export USERNAME=test_user
  export PASSWORD=test_password
  export HTTP_CLIENT=test_client
  export TEST_URL=test_url
  export BASE_URL=test_base
  export LOGIN_ENDPOINT=test_login
  export LOGOUT_ENDPOINT=test_logout
  export ALLOW_EMPTY=1

  run clogin printenv 

  assert_success
  assert_options
}
