class CreatePointsActions < ActiveRecord::Migration
  def change
    create_table :points_actions do |t|
      t.string :action_name
      t.integer :points_value

      t.timestamps
    end
  end
end
