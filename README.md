# clogin(1) -- captive-portal login utility

### SYNOPSIS

`Usage: clogin login|logout|loop|test [--help] [OPTION...]`

Login:

`clogin login -u test -p test`

Test connectivity:

`clogin test`

Continuesly check login state:

`clogin loop -u test -p test`

Logout:

`clogin logout`

## INSTALL

```bash
wget https://raw.githubusercontent.com/pi0/captive-login/master/bin/clogin
chmod +x clogin
sudo mv clogin /usr/local/bin
```

## DESCRIPTION

At Amirkabir university, we have mikrotik powered captive-portal for internet access. This makes some challenges when a persistent internet connection is needed in headless devices and lab servers.

This utility automates captive-portal login proccess. I've tried to generalize all params as possible so it can be used in similar environments, at least with other mikrotik captive-portals.

Behind the scenes, login process is achived by sending a HTTPS `POST` request to `/login` endpoint of captive-portal containing `username` and `password` fields in body. Logout is done by sending a `GET` request to `/logout` endpoint.
Both success if HTTP response code is `302` (Mikrotik spec).
The connectivity test successes when `GET` requst to test url is `200`.
For detailed info of how this script works, see [bin/clogin](bin/clogin). 

**Supported options:**

- `-f, --conf` - Path to config file (Defaults to "clogin.conf")
- `-l, --log-file <val>` - Set log file (Defaults to `/dev/stderr`)
- `-u, --username <val>` - Set login username
- `-p, --password <val>` - Set login password
- `--allow-empty` - Allow using empty username and password
- `-c, --client <val>` - Set http client to make requests. (Possible <val>ues: auto|curl|wget)
- `--base <val>` - Set http client base url (Defauts to "https://login.aut.ac.ir")
- `--login-endpoint <val>` - Set login endpoint (Defaults to "/login")
- `--logout-endpoint <val>` - Set logout endpoint (Defaults to "/logout")
- `--test-url <val>` - Set connectivity test url (Default to "http://icanhazip.com")
- `--loop-interval <val>` - Set loop interval in seconds (Defaults to 1800 = 30 minutes)
- `-h, --help` - Display help message
- `-v, --version` - Display version
-  `-x, --debug` - Debug mode. Shows all internal invoked commands

### CONFIG FILE

Config files at the paths of `/usr/local/etc/clogin.conf`, `/etc/clogin.conf` and `~/.clogin.conf` will be applied if readable in order **before** parsing options. For a complete example see [etc/clogin.conf](etc/clogin.conf).

```bash
USERNAME=foo
PASSWORD=bar
```

When `CONFIG_FILE` environment variable or `-f, --conf` options provided it will be applied **after** parsing options.

### ENVIRONMENT VARIABLES

It is possible to use environment variables instead of arguments to configure clogin.

Supported environment variables:

- `CONFIG_FILE`
- `LOG_FILE`
- `USERNAME`
- `PASSWORD`
- `ALLOW_EMPTY`
- `HTTP_CLIENT`
- `BASE_URL`
- `LOGIN_ENDPOINT`
- `LOGOUT_ENDPOINT`
- `SUCCESS_CODE`
- `TEST_URL`
- `TEST_SUCCESS_CODE`
- `LOOP_INTERVAL`

## DOCKER IMAGE

An alpine based docker image (~9MB) is available for ease of use and deployment.

```bash
docker run -it --rm \
    -e USERNAME="test" \
    -e PASSWORD="test" \
    pooya/clogin loop
```

## DEVELOPMENT

This project uses [BATS](https://github.com/sstephenson/bats) for automated testing, [Dockerfile](https://docs.docker.com/engine/reference/builder) for packaging and [Makefile](https://www.gnu.org/s/make/manual/make.html) for development workflow.

Available Makefile commands:

- `make test` - Run BATS tests
- `make install` - Installs `clogin` utility to `/usr/local/bin`
- `make docker` - Make docker image
- `make docker-test` - Test docker image functionality

Feel free forking this repository and making PRs for features and fixes :)

## LICENSE

Copyright (C) 2018 Pooya Parsa <pooya@pi0.ir>

This work is released under the GNU General Public License v3.0. See [LICENSE](./LICENSE) for details.
