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

  #[NIKKI] specifies photo styles for paperclip/aws
  has_attached_file :profile_pic, dependent: :destroy, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  #before_validation :clean_phone_attribute
  # Validate the attached image is image/jpg, image/png, etc.
  validates_attachment_content_type :profile_pic, :content_type => /\Aimage\/.*\Z/

  # number_regex = /\d[0-9]\)*\z/

  # validates_format_of :phone, :with =>  number_regex, :message => "Only positive number without spaces are allowed"

  has_many :points,  as: :pointable, :through => :habits


  # private

  # def clean_phone_attribute
  # end
end
