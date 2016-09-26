

class PostsController < ApplicationController



	def index
		q = ''
		params.each do |key,value|
			puts "key:" + key
			puts "value: " + value
			if key != 'action' && key != 'controller'
				q += value
			end
  			#Rails.logger.warn "Param #{key}: #{value}"
		end
		if q.length > 2 
			puts "SEARCHING!"
			@posts = Post.search(q)
		else 
			puts "ALLLLLL"
			@posts = Post.all()
		end



		# if parameters
		# while paramters exit
		# .where("param LIKE 'paramValue")
		# if(q){ 
		# 	.where("title or content LIKE 'mememe jjkkj'")
		# }
		# if(lang){ 
		# 	.where("language = 'langugevalue'")
		# }

		#.where("title LIKE 'mememe jjkkj'")

	end

	def show
		@post = Post.find_by(id: params[:id])
	end

	def create
		user = current_user.id
		post = params["post"]
		Post.create( title: post["title"], content: post["content"], rcode: post["rcode"], language: post["language"], user_id: user )
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
    	@post.update( title: post["title"], content: post["content"], rcode: post["rcode"], language: post["language"], user_id: user )
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
    	@post.destroy( title: post["title"], content: post["content"], rcode: post["rcode"], language: post["language"], user_id: user )
		redirect_to ("/posts")
	end



end



