class CommentPolicy < ArticlePolicy
  def show?
    if user.editor? || user.author?
      true
    else
      record.approved?
    end
  end

  def update?
    user.editor? || (user.author? && record.article.author == user)
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
