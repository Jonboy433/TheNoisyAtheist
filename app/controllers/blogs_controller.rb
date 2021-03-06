class BlogsController < ApplicationController
	before_action :all_blogs, only: [:index]
	before_action :find_blog, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]
	#skip_before_filter :verify_authenticity_token, :only => [:destroy]

	def new
		@blog = Blog.new
	end

	def create
		create_display_id
		@blog = Blog.new(blog_params)
		if @blog.save
			redirect_to blog_path(@blog.display_id)
		else
			render 'new'
		end
	end

	def show
		@comments = @blog.comments
		@comment = Comment.new
	end

	def edit
		
	end

	def update
		create_display_id
		if @blog.update(blog_params)
			redirect_to blog_path(@blog.display_id)
			p params
		else
			render 'edit'
		end
			
	end

	def destroy
		@blog.destroy
		redirect_to root_path
	end

	private

	# replacing the index action
	def all_blogs
		@blogs = Blog.all.order("created_at DESC")
	end

	def blog_params
		params.require(:blog).permit(:title, :content, :display_id, :user_id)
	end

	# Clean up the title for a more 
	def create_display_id
		params[:blog][:title] = params[:blog][:title].strip
		params[:blog][:content] = params[:blog][:content].strip
		@display = params[:blog][:title]
		@display = @display.to_s.gsub("'s","s").gsub("'","").gsub(/[^0-9A-Za-z]/, " ").squeeze(" ").strip.gsub(" " ,'-').downcase
		params[:blog][:display_id] = @display
		params[:blog][:user_id] = current_user.id
	end
	
	def find_blog
		@blog = Blog.find_by_display_id(params[:id])
		@user = current_user
	end

end
