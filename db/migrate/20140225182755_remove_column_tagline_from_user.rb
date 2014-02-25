class RemoveColumnTaglineFromUser < ActiveRecord::Migration
  #moving these to a profile model
  def change
    remove_column :users, :tagline, :text
    drop_attached_file :users, :profile_pic
  end
end

