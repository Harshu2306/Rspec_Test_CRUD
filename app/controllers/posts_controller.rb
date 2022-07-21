class PostsController < ApplicationController
	def index
	@posts = Post.all
    render json: @posts
	end

	def create
	@post = Post.new(post_params)
	if @post.save
	  send_response(1, 200, "post is created", ActiveModelSerializers::SerializableResource.new(@post))
	else
	  send_response(0, 404, "Something went wrong",@post.errors)
	end

	end

	def update
	@post = Post.find(post_params[:id])
	if @post.update(post_params)
	  send_response(1, 200, "post is updated", ActiveModelSerializers::SerializableResource.new(@post))
	else
	  send_response(0, 404, "Something went wrong", post.errors)
	end
	end

	def show
	@post = Post.find(params[:id])
	send_response(1, 200, "Your post is : ", ActiveModelSerializers::SerializableResource.new(@post))
	end

	def destroy
	  @post = Post.find(params[:id])
	  if @post.present?
	   @post.destroy 
	   send_response(1, 204, "post is deleted",{})
	  else
	   send_response(0, 404, "post does not exists",{})
	  end
	end

	private 
	def post_params
	  params.permit(:id, :title, :content)
	end
end
