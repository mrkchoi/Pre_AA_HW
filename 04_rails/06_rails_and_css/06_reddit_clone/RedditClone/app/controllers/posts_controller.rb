class PostsController < ApplicationController
  before_action :validate_user, only: [:new]

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id

    if @post.save
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to new_post_url
    end
  end

  def new
    render :new
  end

  def show
    @post = Post.find_by(id: params[:id])
    @comments_by_parent_id = @post.comments_by_parent_id
    render :show
  end

  def edit
    @post = Post.find_by(id: params[:id])
    if logged_in? && current_user.id == @post.author_id
      render :edit
    else
      redirect_to new_session_url
    end
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.update_attributes(post_params)
    @post.sub_ids = params[:post][:sub_ids]

    if @post.save
      redirect_to post_url(@post)
    else
      p params.inspect
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, :author_id, sub_ids: [])
  end

  def validate_user
    if !logged_in? || !current_user
      redirect_to new_session_url
    end
  end
end