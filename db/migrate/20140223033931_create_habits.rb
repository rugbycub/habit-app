class CreateHabits < ActiveRecord::Migration
  def change
    create_table :habits do |t|
      t.string :name
      t.string :category
      t.integer :frequency
      t.string :timeframe
      t.string :visibility
      t.integer :user_id

      t.timestamps
    end
  end
end
