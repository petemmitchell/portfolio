class ArticlePolicy < ApplicationPolicy
  attr_accessor :user, :article

  def initialize(user, article)
    @user = user
    @article = article
  end

  def publish?
    @user.editor?
  end

  def create?
    @user.editor? || @user.author?
  end

  def edit?
    if user
      @user.editor? || @user.id == article.author_id
    else
      false
    end
  end

  def update?
    if user
      @user.editor? || @user.id == article.author_id
    else
      false
    end
  end

  def show?
    if !user
      article.published?
    elsif user.author?
      user.id == article.author_id
    elsif user.editor?
      true
    end
  end

  def destroy?
    user && @user.editor?
  end

  class Scope < Scope
    def resolve
      if @user.editor?
        scope all?
      else
        scope.where(published: true)
      end
    end
  end
end
