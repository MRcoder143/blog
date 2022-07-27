class CommentsController < ApplicationController
	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(cmt_param)
		
		redirect_to article_path(@article)

	end
def edit
	@article = Article.find(params[:article_id])
	@comment = Comment.find(params[:id])

end
def update
@article = Article.find(params[:article_id])
	@comment = Comment.find(params[:id])
if @comment.update(cmt_param)
redirect_to @article
else
render :edit, status: :unprocessable_entity
end

end


	def cmt_param
		params.require(:comment).permit(:comments,:body,:status)
		
	end
end
