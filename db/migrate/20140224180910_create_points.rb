class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer :user_id
      t.integer :pointable_id
      t.integer :action_id

      t.timestamps
    end
  end
end
