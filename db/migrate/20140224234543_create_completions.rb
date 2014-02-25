class CreateCompletions < ActiveRecord::Migration
  def change
    create_table :completions do |t|
      t.boolean :status
      t.integer :habit_id

      t.timestamps
    end
  end
end
