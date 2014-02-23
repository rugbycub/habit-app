class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :friendships, :foreign_key => 'user_id', 
                         :class_name  => "Friendship"
  has_many :friends, :through => :friendships

  has_many :messages

  has_many :habits

  has_many :events, :through => :habits
end
