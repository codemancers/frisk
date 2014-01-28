# This file is used by Rack-based servers to start the application.

root = File.expand_path('../lib', __FILE__)
$:.unshift(root) unless $:.include?(root)

require 'frisk/app'
run Frisk::App
