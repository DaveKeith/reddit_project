class NewUsersController < ApplicationController
  def new
    render "new_user/new_user_login.html.erb"
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def user_params
    params.permit(:username, :email, :password, :confirmation, :full_name)
  end
end
