class ProfilesController < ApplicationController
  before_action :user_set

  def show; end

  def edit; end
  
  def update
    if @user.update(user_params)
      redirect_to profile_path, notice: t('.success')
    else
      flash.now[:alert] = t('.fail')
      render :edit
    end
  end

  def new; end

  def create
    @user.deliver_reset_password_instructions! if @user
    redirect_to mypage_path, notice: t('.send_password_change_email')
  end

  private

  def user_set
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:user_name, :email)
  end
end
