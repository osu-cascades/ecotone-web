class UsersController < ApplicationController

  before_action :login_required, except: [:new, :create]
  before_action :admin_required, only: :destroy
  before_action :prevent_normal_users_from_editing_and_viewing_other_users, only: [:edit, :update, :show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if verify_recaptcha(model: @user) && @user.save
      log_in @user
      flash[:success] = "Welcome to Ecotone!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Account updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def prevent_normal_users_from_editing_and_viewing_other_users
    redirect_to(root_url) unless current_user.id == params[:id].to_i || current_user.admin?
  end

end
