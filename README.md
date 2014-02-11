Frisk
=====

[![Build Status](https://travis-ci.org/code-mancers/frisk.png?branch=master)](https://travis-ci.org/code-mancers/frisk)

## What's frisk ?

Frisk tries to fill the communication gap between developers that develop APIs
and those who write code to consume those APIs. With Frisk, you can tell
which APIs are red(broken), how to construct correct API requests and what the
expected responses are.

Frisk will let you record API requests and responses and create runnable
examples out of those which become your living documentation in development
environment.

To sum it up, Frisk is your

* API doc
* API health check
* API explorer

## Installation

    gem install frisk

This gives you the executable `frisk`, which you can run to start the app.

## Development

1. Clone the repo
2. `bundle install`
3. Write code and tests
4. `bundle exec rake` to run RSpec and Karma JS test runner
