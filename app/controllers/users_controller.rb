class UsersController < ApplicationController


  get '/login' do
    erb :'/users/login'
  end

  get '/signup' do
   if Helpers.is_logged_in?(session)
     redirect "/tweets"
   end

  erb :'/users/signup'

  end

  post '/signup' do
  # binding.pry {"username"=>"skittles123", "email"=>"skittles@aol.com", "password"=>"rainbows"}

    params.each do |key, value|
      if value.empty?
        redirect "/signup"
      end
    end

    user = User.create(params)
    session[:user_id] = user.id
    redirect "/tweets"
  end

end
