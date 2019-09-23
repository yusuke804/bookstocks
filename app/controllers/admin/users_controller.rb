class Admin::UsersController < ApplicationController
  before_action :require_admin
  
  def index
    @users = User.all.order(id: :desc)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "ユーザーを削除しました"
  end

  private
  
  def require_admin
    redirect_to root_path unless current_user.admin?
  end
end

