class HabitsController < ApplicationController
before_action :authenticate_user!

  def index
    
    @habits = current_user.habits # TODO where habit is active

    respond_to do |f|
      f.html
      f.json { render json: @habits.to_json }
    end
  end

  def show 
    @habit = Habit.find(params[:id])

    respond_to do |f|
      f.html
      f.json { render json: @habit.to_json }
    end
  end

  def new
    @habit = Habit.new

    respond_to do |f|
      f.html
      f.json { render json: @habit.to_json }
    end
  end

  def destroy
    habit = Habit.find(params[:id])
    habit.destroy

    respond_to do |f|
      f.html { redirect_to action: :index }
      f.json { render json: habit.to_json }
    end
  end

end
