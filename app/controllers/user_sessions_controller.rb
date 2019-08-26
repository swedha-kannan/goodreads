class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new(User.find_by_smart_case_login_field(params[:token]))
  end

  def create
    @user_session = UserSession.new(user_session_params.to_h)
   
    if @user_session.save
       if User.find_by(:email => @user_session.email).is_admin?
        redirect_to root_path
       else
        redirect_to root_path
       end
    else
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    redirect_to root_path
  end

  private

  def user_session_params
    params.require(:user_session).permit(:email, :password, :remember_me)
  end
end
