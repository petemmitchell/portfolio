class CommentsController < ApplicationController
  before_action :set_article

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def new
    @comment = Comment.new
  end

  private
  def comment_params
    params.require(:comment).permit(:author, :body, :content)
  end
end
