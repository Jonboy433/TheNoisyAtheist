class CommentsController < ApplicationController
	
	def create
		@blog = Blog.find_by_display_id(params[:id])
		@comment = @blog.comments.build(comment_params)
		@comment.blog = @blog
    	@comment.user = current_user

		respond_to do |format|
			if @comment.save
				@saved = true #storing bool for js.erb
    			format.html { redirect_to blog_path(@blog.display_id) }
				format.js { render status: :created }
			else
				@saved = false
				format.js { render status: :unprocessable_entity}
			end
		end
	end
	
	
	private
	def comment_params
		params.require(:comment).permit(:content)
	end

end
