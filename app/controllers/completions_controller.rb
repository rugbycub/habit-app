class CompletionsController < ApplicationController

  def create
    habit = current_user.habits.find_by_name()
    complete = habit.completions.create()

    respond_to do |f|
      f.json { render json: complete.to_json }
    end
  end

  

end
