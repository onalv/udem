# fastapi_demo

## Development Pre-Requisites

1. Install python 3.9 or greater.
2. Install [Docker](https://docs.docker.com/get-docker/).
3. Install [aws-cli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).
4. Install [aws-sam-cli](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html).
5. Install [GIT](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).
6. install [Poetry](https://python-poetry.org/docs/#installation).

## Installation

* From the project home
```bash
$ make install
```
* To run via docker container
```bash
$ docker-compose up
```
* To stop the app
```bash
$ docker-compose down
```

## Manual Deploy
log into aws-cli
```bash
$ aws configure
AWS Access Key ID [None]: AKIAIOSFODNN7EXAMPLE
AWS Secret Access Key [None]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
Default region name [None]:
Default output format [None]:
```
change `samconfig.toml` to match aws s3 bucket name

deploy

```bash
sam build
```

manual deploy

```bash
sam deploy -g
```
verify on https://us-east-1.console.aws.amazon.com/cloudformation/home?region=us-east-1#/ the stack
and  the code on: https://us-east-1.console.aws.amazon.com/lambda/home?region=us-east-1#functions/fast-api-poetry-ml-sandbox

# Clean up
* delete aws cloudformation stack
* delete s3 bucket
* delete ecr

## Versioning

Semantic versioning is used.  When you are satisfied with your work, you need to bump your
version number and include it as part of your merge request. The following `make` targets will bump the version
number in the following locations appropriately. When you bump your version, the following files will be modified:

* CHANGELOG.md
* pyproject.toml
* .bumpversion.cfg

Be sure to add a relevant message to the `CHANGELOG.md` file after your bump your version.

The `make` targets are as follows:

Bump Major

```bash
$ make bump-major
```

 Bump Minor

```bash
$ make bump-minor
```


Bump Patch

```bash
$ make bump-patch
```
