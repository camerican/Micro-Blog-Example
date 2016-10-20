#models.rb
class User < ActiveRecord::Base
  has_many :comments
  has_many :topics
end
class Topic < ActiveRecord::Base
  belongs_to :user, class_name: 'User', foreign_key: 'creator'
  has_many :comments
end
class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic

  has_many :comments, class_name: 'Comment'
  belongs_to :parent, class_name: 'Comment', foreign_key: 'parent'
end