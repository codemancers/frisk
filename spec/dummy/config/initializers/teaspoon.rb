Teaspoon.setup do |config|
  config.root = Frisk::Engine.root
  config.mount_at = "/teaspoon"
  config.asset_paths = ["spec/javascripts"]
  config.fixture_path = "spec/javascripts/fixtures"

  config.suite do |suite|

    # You can specify a file matcher and all matching files will be loaded when the suite is run. It's important that
    # these files are serve-able from sprockets.
    #
    # Note: Can also be set to nil.
    suite.matcher = "{spec/javascripts,app/assets}/**/*_spec.{js,js.coffee,coffee}"

    # Each suite can load a different helper, which can in turn require additional files. This file is loaded before
    # your specs are loaded, and can be used as a manifest.
    suite.helper = "spec_helper"

    # These are the core Teaspoon javascripts. It's strongly encouraged to include only the base files here. You can
    # require other support libraries in your spec helper, which allows you to change them without having to restart the
    # server.
    #
    # Available frameworks: teaspoon-jasmine, teaspoon-mocha, teaspoon-qunit
    #
    # Note: To use the CoffeeScript source files use `"teaspoon/jasmine"` etc.
    suite.javascripts = ["teaspoon-jasmine"]

    # If you want to change how Teaspoon looks, or include your own stylesheets you can do that here. The default is the
    # stylesheet for the HTML reporter.
    suite.stylesheets = ["teaspoon"]

    # When running coverage reports, you probably want to exclude libraries that you're not testing.
    # Accepts an array of filenames or regular expressions. The default is to exclude assets from vendors or gems.
    suite.no_coverage = [%r{/lib/ruby/gems/}, %r{/vendor/assets/}, %r{/support/}, %r{/(.+)_helper.}]
    # suite.no_coverage << "jquery.min.js" # excludes jquery from coverage reports

  end
end if defined?(Teaspoon) && Teaspoon.respond_to?(:setup) # let Teaspoon be undefined outside of development/test/asset groups
