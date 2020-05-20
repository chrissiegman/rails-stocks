class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def login
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to tickers_path 
    else
      flash[:error] = "Login failed. Please try again"
      redirect_to '/login'
    end
  end

  def welcome
  end

  def page_requires_login
  end

  def destroy
    session.destroy
    redirect_to '/welcome'
  end

end
