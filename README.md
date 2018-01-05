# Headless Login

> Automated HTTP login utility for headless environments written in pure Bash.


# Usage

```
    Usage: hlogin [login|logout|check] [--help] [OPTION...] 

    Auto HTTP login command for headless environments

    Options:
        -u, --username VAL    Set login username
        -p, --password VAL    Set login password
        -c, --client VAL      Set http client to make requests. (Possible values: auto|curl|wget)
        --test-url VAL        Set auth test url (Default to "http://icanhazip.com")
        --base VAL            Set http client base url (Defauts to "https://login.aut.ac.ir")
        --login-endpoint VAL  Set login endpoint (Defaults to "/login")
        --logout-endpoint VAL Set logout endpoint (Defaults to "/logout")
        --allow-empty         Allow using empty username and password

        -h, --help        Display this help message
        -v, --version     Display version

    Supported environment variables:
        - USERNAME
        - PASSWORD
        - HTTP_CLIENT
        - TEST_URL
        - BASE_URL
        - LOGIN_ENDPOINT
        - LOGOUT_ENDPOINT
        - ALLOW_EMPTY
        - SUCCESS_CODE
        - CHECK_SUCCESS_CODE
```

# LICENSE

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
