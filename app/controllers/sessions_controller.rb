class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user.password_hash == params[:user][:password_hash]
      session[:user_id] = @user.id
      redirect_to @user
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
