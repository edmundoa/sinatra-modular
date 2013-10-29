class MyController < BaseController
  get '/controller' do
    flash[:error] = 'I am THE FLASH'
    erb :'my_controller/show'
  end
end
