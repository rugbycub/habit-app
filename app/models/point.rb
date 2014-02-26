class Point < ActiveRecord::Base
  belongs_to :pointable, polymorphic: true
  has_one :points_action, :foreign_key => "id",
                          :class_name  => "PointsAction"
end
