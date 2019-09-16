class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(id: :desc).page(params[:page]).per(10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  
    if @user.save
      flash[:success] = "会員登録が完了しました"
      redirect_to @user
    else
      flash.now[:danger] = "会員登録に失敗しました"
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def likes
    @user = User.find(params[:id])
    @favorites = @user.favposts.page(params[:page]).per(10)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end
end
