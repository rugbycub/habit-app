class PointsAction < ActiveRecord::Base
  has_many :points , :foreign_key => "action_id",
                     :class_name  => "Point"
    
end
