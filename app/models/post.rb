lass Post < ActiveRecord::Base
  belongs_to :postable, polymorphic: true
  belongs_to :user, :through => :habits
  has_many :posts, as: :postable
end
