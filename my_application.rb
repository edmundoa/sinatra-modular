require 'sinatra/base'
require 'rack-flash'

class MyApplication < Sinatra::Base
  # enable flash messages
  enable :sessions
  use Rack::Flash

  set :root, File.dirname(__FILE__)
end

%w(controllers/base_controller.rb
   controllers/*
   views/*).each do |expression|
     Dir.glob(expression).each {|file| require file }
   end
