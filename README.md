Frisk
=====

[![Build Status](https://travis-ci.org/code-mancers/frisk.png?branch=master)](https://travis-ci.org/code-mancers/frisk)

## What's frisk ?

Frisk is a mountable Rails engine which

* documents your API
* acts as your API health check
* gives you an API explorer

## Installation

Add this to your Gemfile and run `bundle install`:

    gem 'frisk'

This will install the gem and mount frisk on `/frisk`
path of your application.

## Development

1. Clone the repo
2. `bundle install`
3. Write code and tests
4. `bundle exec rake` to run RSpec and Karma JS test runner
