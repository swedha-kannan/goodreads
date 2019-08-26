class UsersController < ApplicationController
  def setup
    activate_authlogic
  end

  def index
    @users = User.all
  end

  def show
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    User.find_by(:id => params[:id]).destroy
    redirect_back fallback_location:  root_path
  end

  private

  def users_params
    params.require(:user).permit(:email, :password)
  end
end
