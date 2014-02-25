class AddDateToCompletion < ActiveRecord::Migration
  def change
    add_column :completions, :date, :datetime
  end
end
