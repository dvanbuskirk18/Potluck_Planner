class SessionsController < ApplicationController
  def new
  end

  def create
    @this_user = User.find_by(name: params[:user][:name])
    if @this_user.password_hash == params[:user][:password_hash]
      session[:user_id] = @this_user.id
      redirect_to @this_user
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
