class LoginsController < ApplicationController
  def new
    render "logins/login.html.erb"
  end

  def create
    @user = User.find_by(email: params["email"],
                      password: params["password"])

    if @user
      session[:user_id] = @user.id
      flash[:notice] = "log in successful!"
      redirect_to :root
    else
      flash[:notice] = "Wrong email and/or password."
      render "logins/login.html.erb"
    end
  end

  def show
    @user = @user.find(params["id"])
  end

  def delete
    session[:user_id] = nil
    redirect_to :root
  end
end
