class PostsController < ApplicationController
	def new
		@post = Post.new
		#ada @ bisa diambil di view
		redirect_to root_path

	end
	def index
		@post= Post.all
		respond_to do |format|
			format.html
			format.json {render json: @post }
			format.xml {render xml: @post }
		end
	end
	def create
		@post = Post.new(params.require(:post).permit(:title, :content))
		if @post.save

			redirect_to posts_new_path, 
			notice: 'success'
		else
			render :new
		end
	end
	
	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post.update(params.require(:post).
			permit(:title,
				:content,))
		redirect_to root_path
	end

	def show
		post = Post.find(params[:id])
		render json: post
	end
	def destroy
		post = Post.find(params[:id])
		post.destroy
		redirect_to root_path
	end
	
end
