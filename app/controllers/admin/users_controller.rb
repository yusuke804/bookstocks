class Admin::UsersController < ApplicationController
  before_action :require_admin
  
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).order(id: :desc).page(params[:page]).per(20)
  end

  def destroy
    @user = User.find(params[:id])
    @posts = @user.posts 
    @favorites = @user.favorites
    
    @user.transaction do
      @posts.each do |post|
        post.searches.each do |search|
          search.destroy!
        end
        post.destroy!
      end
      @favorites.each do |favorite|
        favorite.destroy!
      end
      @user.destroy!
    end
    
    flash[:success] = "ユーザーを削除しました"
    redirect_to admin_users_path
    
    rescue => e
      render plain: e.message
  end

  private
  
  def require_admin
    redirect_to root_path unless current_user.admin?
  end
end

