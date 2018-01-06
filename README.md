# Captive Login

> Captive portal login utility for headless environments written in pure bash

### History

At [Amirkabir](https://www.aut.ac.ir/aut/) university, we have a captive portal (on Mikrotik routers) for internet access. This makes some troubles when a persistent internet connection is needed in LAB servers and headless devices. This utility automates login proccess. I've tried to generalize all params as possible so it can be used in similar environments.

## Getting started

**Download script:**

```bash
wget https://raw.githubusercontent.com/pi0/headless-login/master/bin/clogin
chmod +x clogin
sudo mv clogin /usr/local/bin
```

**Login:**

We can also ommit username or password params and enter them interactively.

```bash
clogin login -u test -p test
```

**Test internet connectivity:**

```bash
clogin test
```

**Logout:**

```bash
clogin logout
```

## Docker image

An alpine based docker image is also available for ease of use and deployment.

```bash
docker run -it --rm \
        -e USERNAME="test" \
        -e PASSWORD="test" \
        pooya/clogin login
```

## Usage

```bash
clogin [login|logout|test] [--help] [OPTION...] 
```

Options:

Option                   | Description
-------------------------|------------------------------------------------------------------------
`-u, --username VAL`     | Set login username
`-p, --password VAL`     | Set login password
`-c, --client VAL`       | Set http client to make requests. (Possible values: auto|curl|wget)
`--test-url VAL`         | Set auth test url (Default to "http://icanhazip.com")
`--base VAL`             | Set http client base url (Defauts to "https://login.aut.ac.ir")
`--login-endpoint VAL`   | Set login endpoint (Defaults to "/login")
`--logout-endpoint VAL`  | Set logout endpoint (Defaults to "/logout")
`--allow-empty`          | Allow using empty username and password
`-h, --help`             | Display help message
`-v, --version`          | Display version
`-x, --debug`            | Debug mode. Shows all internal invoked commands

### Environment variables

It is possible to use Environment variables instead of arguments to configure clogin.
Currently supported environment variables:

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

## Behind the scenes

Login process is done by sending a HTTP(S) `POST` request to `/login` endpoint of captive portal containing `username` and `password` fields. Logout is also done by sending a `GET` request to `/logout` endpoint.
Both success if HTTP response code is `302` (Mikrotik spec) is returned.
The connectivity test also successes when `GET` requst to test url is `200`.
For detailed info of how this script works, see sourcecode [bin/clogin](bin/clogin). 

## Development

This project uses [BATS](https://github.com/sstephenson/bats) for automated testing, [DockerFile](https://docs.docker.com/engine/reference/builder) for packaging and [Makefile](https://www.gnu.org/s/make/manual/make.html) for development workflow.

Available Makefile commands:

- **make test** - Run BATS tests
- **make install** - Installs `clogin` utility to `/usr/local/bin`
- **make docker-build** - Make docker image
- **make docker-test** - Test docker image functionality (Also runs `docker-build`)

Feel free forking this repository and making PRs for features and fixes :)

## LICENSE

```
    Copyright (C) 2018 Pooya Parsa <pooya@pi0.ir>
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
```
