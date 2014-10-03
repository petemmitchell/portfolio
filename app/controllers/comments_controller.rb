class CommentsController < ApplicationController
  before_action :set_article

  def create
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def new
    @comment = Comment.new
  end

  def update
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
    authorize @comment
    @comment.approved = true
    if @comment.save
      redirect_to @article, notice: 'Comment approved.'
    else
      redirect_to @article, alert: 'Could not approve the Comment.'
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @article, notice: 'Comment rejected.'
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:author, :content)
  end
end
