class SessionsController < ApplicationController
  def new
  end

  def create
    puts "in the session create"
    puts User.authenticate_with_credentials(params[:email], params[:password]
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # success logic, log them in
      session[:user_id] = @user.id
      redirect_to '/'
    else
      puts "in session create - params don't match"
      # failure, render login form
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end

