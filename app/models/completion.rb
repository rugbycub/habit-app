class Entry < ActiveRecord::Base
  belongs_to :habit, :foreign_key => "habit_id",
                     :class_name  => "Habit"
end
