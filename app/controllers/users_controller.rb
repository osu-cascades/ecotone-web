class UsersController < ApplicationController
  
  before_action :login_required, except: [:new, :create]
  before_action :admin_required, only: :destroy
  before_action :prevent_normal_users_from_viewing_other_users, only: [:show]

  def index
    @users = User.order(name: :asc).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'User deleted.'
    redirect_to users_url
  end

  private

  def prevent_normal_users_from_viewing_other_users
    redirect_to(root_url) unless current_user.id == params[:id].to_i || current_user.admin?
  end
  
end
