class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by(name: params[:name])
  	binding.pry
  	if @user.password_hash == params[:password]
      session[:user_id] = @user.id
      redirect_to @user
    end
  end

  def destroy
    reset_session
    redirect_to '/'
  end
end
