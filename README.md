# API GATEWAY

The project is an api gateway for external access to api.mercadolibre.com


## Technical Challenge

There are more than 30,000 servers on the **mercadolibre** where the applications are run.

There is communication bettwen each service through endpoints(API).

There are APIs with access external through **api.mercadolibre.com**.

The client makes the request through api.mercadolibre.com for the desired resource and the API GATEWAY must send the request for the desired service.


#### UseCase

1. Control the maximum value of requests
 - By origin IP
 - By destination
 - Combination of both
 - Other control criteria or alternative
2. Store and consult api proxy usage statisics
3. Code on Github
4. The proxy must exceed 50,0000 requests per second.

## About

The project have a Makefile to learn more about click on the link. [Makefile](https://www.embarcados.com.br/introducao-ao-makefile/)

## Architecture


## Setup

Execute the command:

```shell
  bin/setup
```

## Environment dependencies

  * Ruby 2.7.3
  * BUNDLER 2.2.21
## OpenAPI 3.0 with Documentation

To check the documentation with the apis go to: `http://localhost:3000/api-docs`.

To generation documentation with OpenAPI 3.0 specification use:

```
  make generate_document_api
```

or

```
  bundle exec rails rswag:specs:swaggerize
```

## Run Tests

```
  make test
```