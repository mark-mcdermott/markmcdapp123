class SessionsController < ApplicationController

  skip_before_action :authorized, only: [:welcome, :new, :create]

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(password: params[:password])
      session[:user_id] = @user.id 
    end
    redirect_to "/"
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/"
  end

end
