class UsersController < ApplicationController
  # def show
  #   @nickname = current_user.nickname
  # end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:users).permit(:email, :password_confirmation, :password, :nickname, :last_name_zen, :first_name_zen, :last_name_kana, :first_name_kana, :birthday)
  end
end