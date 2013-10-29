require 'sinatra/base'
require 'rack-flash'

require 'config/configuration'

class MyApplication < Sinatra::Base
  register Sinatra::Configuration

  # enable flash messages
  enable :sessions
  use Rack::Flash

  set :root, File.dirname(__FILE__)
  load_configuration
end

%w(controllers/base_controller.rb
   controllers/*
   views/*).each do |expression|
     Dir.glob(expression).each {|file| require file }
   end
