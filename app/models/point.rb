class Point < ActiveRecord::Base
  belongs_to :pointable, polymorphic: true
  has_one :points_action
end
