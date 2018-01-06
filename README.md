# clogin(1) -- captive-portal login utility

### SYNOPSIS

`clogin [login|logout|test] [--help] [OPTION...]`

Login:
`clogin login -u test -p test`

Test connectivity:
`clogin test`

Logout:
`clogin logout`

## INSTALL

```bash
wget https://raw.githubusercontent.com/pi0/headless-login/master/bin/clogin
chmod +x clogin
sudo mv clogin /usr/local/bin
```

## DESCRIPTION

At [Amirkabir](https://www.aut.ac.ir/aut/) university, we have mikrotik powered captive-portal for internet access. This makes some challenges when a persistent internet connection is needed in headless devices and lab servers.

This utility automates captive-portal login proccess. I've tried to generalize all params as possible so it can be used in similar environments, at least with other mikrotik captive-portals.

Behind the scenes, login process is achived by sending a HTTPS `POST` request to `/login` endpoint of captive-portal containing `username` and `password` fields in body. Logout is done by sending a `GET` request to `/logout` endpoint.
Both success if HTTP response code is `302` (Mikrotik spec).
The connectivity test successes when `GET` requst to test url is `200`.
For detailed info of how this script works, see [bin/clogin](bin/clogin). 

**Supported options:**

- `-u, --username <val>` - Set login username
- `-p, --password <val>` - Set login password
- `-c, --client <val>` - Set http client to make requests. (Possible <val>ues: auto|curl|wget)
- `--test-url <val>` - Set auth test url (Default to "http://icanhazip.com")
- `--base <val>` - Set http client base url (Defauts to "https://login.aut.ac.ir")
- `--login-endpoint <val>` - Set login endpoint (Defaults to "/login")
- `--logout-endpoint <val>` - Set logout endpoint (Defaults to "/logout")
- `--allow-empty` - Allow using empty username and password
- `-h, --help` - Display help message
- `-v, --version` - Display version
-  `-x, --debug` - Debug mode. Shows all internal invoked commands


## DOCKER

An alpine based docker image (~9MB) is available for ease of use and deployment.

```bash
docker run -it --rm \
    -e USERNAME="test" \
    -e PASSWORD="test" \
    pooya/clogin login
```

### ENVIRONMENT VARIABLES

It is possible to use environment variables instead of arguments to configure clogin.

Supported environment variables:

- `USERNAME`
- `PASSWORD`
- `HTTP_CLIENT`
- `TEST_URL`
- `BASE_URL`
- `LOGIN_ENDPOINT`
- `LOGOUT_ENDPOINT`
- `ALLOW_EMPTY`
- `SUCCESS_CODE`
- `TEST_SUCCESS_CODE`


## DEVELOPMENT

This project uses [BATS](https://github.com/sstephenson/bats) for automated testing, [Dockerfile](https://docs.docker.com/engine/reference/builder) for packaging and [Makefile](https://www.gnu.org/s/make/manual/make.html) for development workflow.

Available Makefile commands:

- `make test` - Run BATS tests
- `make install` - Installs `clogin` utility to `/usr/local/bin`
- `make docker-build` - Make docker image
- `make docker-test` - Test docker image functionality

Feel free forking this repository and making PRs for features and fixes :)

## LICENSE

Copyright (C) 2018 Pooya Parsa <pooya@pi0.ir>

This work is released under the GNU General Public License v3.0. See [LICENSE](./LICENSE) for details.
