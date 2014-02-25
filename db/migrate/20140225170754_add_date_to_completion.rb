class AddDateToCompletion < ActiveRecord::Migration
  def change
    add_column :completions, :date, :date
  end
end
