class Habit < ActiveRecord::Base
    belongs_to :user

    has_many :completions

    has_many :posts, as: :postable

    has_many :points, as: :pointable

    validates :frequency, presence: true
    validates :frequency, numericality: { only_integer: true }
    validates :frequency, inclusion: 1..7, if: :weekly?
    validates :frequency, inclusion: {in: 1..31, message: "ERROR", if: :monthly?} 

    def weekly?
      timeframe == "week"
    end

    def monthly?
      timeframe == "month"
    end

end
