class Post < ActiveRecord::Base
  belongs_to :postable, polymorphic: true
  #belongs_to :user, through: :habits (commenting out for heroku)
  has_many :posts, as: :postable
  
  belongs_to :user

  delegate :user, :to => :habit, :allow_nil => true
end
