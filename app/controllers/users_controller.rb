class UsersController < ApplicationController


  get '/login' do
    erb :'/users/login'
  end

  # post '/login' do
  #   # puts params {"username"=>"Shannon", "password"=>"rats", "Log In"=>"Log In"}
  #   user = User.find_by(:username => params[:username])
  #     if user && user.authenticate(params[:password])
  #       @session[:user_id] = user.id
  #       redirect "/tweets"
  #     else
  #       redirect "/signup"
  #     end
  #   # @session = session
  #   # @session["user_id"] = @user.id
  # end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to "/tweets"
    else
      redirect to '/signup'
    end
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
