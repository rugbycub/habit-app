class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.boolean :status
      t.integer :habit_id

      t.timestamps
    end
  end
end
