TODO
====

1. API to save a request and its expected response
  * Save request and expected response as JSON in a file for now
2. API to get all requests and expected responses
3. Compare Sinatra vs Rails Engine
  * Using Rails engine will allow us to make use of teaspoon
    ( but Angular testing is currently an experimental feature in Teaspoon, as per
    their [wiki](https://github.com/modeset/teaspoon/wiki/Using-Angular) )
  * All we need is a single HTML and a few methods in the backend that can make/save requests.
    Sinatra looks good enough
  * Could use yeoman to create angular app and test it. Can configure the Grunt build so that
    the compiled site is placed in `public` directory which can be served by Sinatra.
