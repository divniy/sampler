class UsersController < ApplicationController
  allow_unauthenticated_access only: [:new, :create]
  before_action :set_user, only: [:show]

  respond_to :html

  def show
    respond_with(@user)
  end

  def new
    @user = User.new
    respond_with(@user)
  end

  def create
    @user = User.new(user_params)
    @user.save
    start_new_session_for @user
    UserMailer.with(user: @user).confirm_email.deliver_later
    respond_with(@user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email_address, :password, :password_confirmation)
  end
end
