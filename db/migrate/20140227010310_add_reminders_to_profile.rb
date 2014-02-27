class AddRemindersToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :reminders, :boolean
  end
end
