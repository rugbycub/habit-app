class HabitsController < ApplicationController

  def index
    @habits = Habit.all

    respond_to do |f|
      f.html
      f.json { render json: { @habits.to_json } }
    end
  end

  def show 
    @habit = Habit.find(params[:id])

    respond_to do |f|
      f.html
      f.json { render json: { @habit.to_json } }
    end
  end

  def new
    @habit = Habit.new

    repond_to do |f|
      f.html
      f.json { render json: { @habit.to_json } }
    end
  end

end
