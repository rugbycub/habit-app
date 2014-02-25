class Habit < ActiveRecord::Base
    belongs_to :user

    has_many :completions

    has_many :posts, as: :postable

    has_many :points, as: :pointable
end
