class AddProfilePicToProfile < ActiveRecord::Migration
  def self.up
    add_attachment :profiles, :profile_pic
  end

  def self.down
    remove_attachment :profiles, :profile_pic
  end
end
