class PostsController < ApplicationController
  # shows all the posts
  def index
		# how do I get data from database and put it here???

		# this will store all the posts in an array into the variable @posts
    @posts = Post.all
  end

  # this is also function
  def new
    @post = Post.new
  end

  # this is also function
  def create
    # post = Post.new(title: params[:post][:title], url: params[:post][:title])
    post = Post.new(post_params)
    if post.save
      redirect_to posts_path
    end
  end

  # this only shows 1 post
  def show
    # params[:id] will look for the id in the URL

    # this basically retrieve the post with a specific id
    @post = Post.find(params[:id])
  end

  # this is only for internal use
  private
    # def means I am defining a function. A function can also be called as a 'method' or an 'action'
    def post_params
      params.require(:post).permit(:title, :url)
    end
end
