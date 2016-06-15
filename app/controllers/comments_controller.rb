class CommentsController < ApplicationController
	
	def create
		@blog = Blog.find_by_display_id(params[:id])
		@comment = @blog.comments.build(comment_params)
		@comment.blog = @blog
    	@comment.user = current_user
		@comment.save
    	redirect_to blog_path(@blog.display_id)
	end
	
	
	private
	def comment_params
		params.require(:comment).permit(:content)
	end

end
