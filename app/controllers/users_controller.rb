class UsersController < ApplicationController
  def index
    if user_signed_in?
      @users = User.where(username_id: current_user.id).order('created_at DESC')
    end
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_show_path
    else
      render "edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :profile_image, :username, :self_introduction)
  end
end
