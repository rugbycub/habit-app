class HabitsController < ApplicationController

  def index
    @habits = Habit.all

    respond_to |f|
      f.html
      f.json { render json: { @habits.to_json } }
    end
  end

end
