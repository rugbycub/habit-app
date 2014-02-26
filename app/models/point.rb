class Point < ActiveRecord::Base
  belongs_to :pointable, polymorphic: true
  belongs_to :points_action
end
