class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.references :postable, polymorphic: true
      t.integer :upvotes
      t.integer :downvotes
      t.text :body

      t.timestamps
    end
  end
end
