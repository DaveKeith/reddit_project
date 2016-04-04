class NewUsersController < ApplicationController
  def new
    render "new_user/new_user_login.html.erb"
  end

  def create
    new_user = User.create(username: params["username"],
                        email: params["email"],
                        password: params["password"])
    redirect_to :root
  end
end
