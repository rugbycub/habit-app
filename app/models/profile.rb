class Profile < ActiveRecord::Base

  belongs_to :user

  has_attached_file :profile_pic, dependent: :destroy, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  validates_attachment_content_type :profile_pic, :content_type => /\Aimage\/.*\Z/

end
