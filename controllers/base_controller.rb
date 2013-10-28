# BaseController provides a base class to put some common routes and behavior
# shared by your controllers. It uses Sinatra::Delegator to forward get, post,
# put and some other messages to your main application.
# The main purpose of this class is to allow you to easily create different
# controllers and split them into different classes, which could be useful
# if you want to better structure your Sinatra application into into several
# files. At the same time you'll keep some sugar from Sinatra.
class BaseController
  extend Sinatra::Delegator
  Sinatra::Delegator.target = MyApplication

  get '/hello_world' do
    'Hello World!'
  end
end
