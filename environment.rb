require "sinatra"

# The code below will automatically require all the gems listed in our Gemfile,
# so we don't have to manually require gems a la
#
#   require "data_mapper"
#   require "dotenv"
#
# See: http://bundler.io/sinatra.html

require "rubygems"
require "bundler/setup"

Bundler.require(:default, Sinatra::Application.environment)

# Bundler.require(:default) will automatically require all global gems and
# Bundler.require(Sinatra::Application.environment) will automatically require
# all environment-specific gems.
#
# See: http://bundler.io/v1.6/groups.html
#
# NOTE: Sinatra::Application.environment is set to the value of ENV['RACK_ENV']
# if ENV['RACK_ENV'] is set.  Otherwise, it defaults to :development.

