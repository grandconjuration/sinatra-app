require 'sinatra'

set :env, :development
disable :run

require './myapp.rb'

run MyApp
