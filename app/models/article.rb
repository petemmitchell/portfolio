class Article < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
<<<<<<< Updated upstream

  def publish!
    published = true
    save!
=======
  has_many :comments

  def authored_by?(user)
    author == user
>>>>>>> Stashed changes
  end
end
