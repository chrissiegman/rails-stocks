class UsersController < ApplicationController
  def new
  end

  def create

    # Need to add validation
    @user = User.create(params.require(:user).permit(:username, :password))

    session[:user_id] = @user.id

    redirect_to '/welcome'

  end

end
