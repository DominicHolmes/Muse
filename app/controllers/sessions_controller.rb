require 'bcrypt'

class SessionsController < ApplicationController

  include BCrypt

  def new
  end

  # POST /sessions
  # POST /sessions.json
  def create
    @user = User.find_by_email(params[:email])
    #input_password = BCrypt::Password.create(params[:password])
    #if @user.password == input_password
    if (@user != nil) then
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      redirect_to sessions_new_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to posts_path
  end
end
