class Habit < ActiveRecord::Base
    belongs_to :user

    has_many :completions

    has_many :posts, as: :postable

    has_many :points, as: :pointable

    validates :frequency, presence: { message: "Add your number of days per week for this habit" }
    validates :frequency, inclusion: {in: 1..7, message: "Enter a number 1 to 7 for the week", if: :weekly?} 
    validates :frequency, inclusion: {in: 1..31, message: "Enter a number 1 to 31 for the week", if: :monthly?} 

    def weekly?
      timeframe == "week"
    end

    def monthly?
      timeframe == "month"
    end

    def private?
      visibility == "private"
    end

    def this_weeks_completions
        completions.where( "date > ? AND date < ? ", Date.today.beginning_of_week-2,Date.today+1 )
    end
end
