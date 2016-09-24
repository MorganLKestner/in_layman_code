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

	def edit
		# is a form_for that calls on the update action.
		@action = "update"
		@method = "patch" 
		@post = Post.find_by(id: params[:id])

	end

	def update 
		@action = "update"
    	@post = Post.find_by(id: params[:id])
    	user = current_user.id
    	post = params["post"]
    	@post.update( title: post["title"], context: post["context"], user_id: user )
		redirect_to ("/posts")
	end


	def new
		@action = "create"
		@method = "post"
		@post = Post.new

	end

	def destroy 
		@action = "delete"
    	@post = Post.find_by(id: params[:id])
    	user = current_user.id
    	post = params["post"]
    	@post.destroy( title: post["title"], context: post["context"], user_id: user )
		redirect_to ("/posts")
	end



end



