class PostsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :edit, :update, :destroy, :likes]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def index
    @posts = Post.all.order(id: :desc).page(params[:page]).per(5)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.build
    @post.searches.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿を正常に送信しました"
      redirect_to @current_user
      
    else
      flash[:denger] = "投稿に失敗しました"
      render "posts/new"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "投稿を正常に更新しました"
      redirect_to @post
    else
      flash[:danger] = "投稿の更新に失敗しました"
      render "posts/edit"
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to posts_path
  end

  def tagged
    @tag = Tag.find(params[:tag_id])
    @posts = @tag.posts.page(params[:page])
  end

  private
  
  def post_params
    params.require(:post).permit(:introduce_content, :tweet_content, :author_name, :novel_title, tag_ids: [ ])    
  end
  
  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_url
    end
  end
end




