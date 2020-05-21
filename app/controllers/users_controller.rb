class UsersController < ApplicationController

  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    if User.exists?(username: params[:user][:username])
      flash[:error] = "That username is already taken. Please pick a different username."
      redirect_to '/signup'
    else
      @user = User.create(params.require(:user).permit(:username, :password))
      session[:user_id] = @user.id
      redirect_to watchlists_path 
    end
  end

end
