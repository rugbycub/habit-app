class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer :user_id
      t.references :pointable, polymorphic: true
      t.integer :action_id

      t.timestamps
    end
  end
end
