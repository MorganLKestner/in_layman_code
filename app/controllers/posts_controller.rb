class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find_by(id: params[:id])
	end

	def create
		user = current_user.id
		post = params["post"]
		Post.create( title: post["title"], context: post["context"], user_id: user )
		redirect_to ("/posts") 
	end

	def new
		@post = Post.new

	end

	def destroy 
	end



end
