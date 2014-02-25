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

  has_many :completions, :through => :habits

  has_one :profile

  #before_validation :clean_phone_attribute

  # number_regex = /\d[0-9]\)*\z/

  # validates_format_of :phone, :with =>  number_regex, :message => "Only positive number without spaces are allowed"



  # private

  # def clean_phone_attribute
  # end
end
