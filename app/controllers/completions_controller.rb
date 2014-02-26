class CompletionsController < ApplicationController
  before_action :authenticate_user!


  def create
    habit = current_user.habits.find_by_name(params[:name])

    complete = habit.completions.create(status: true, date: Date.parse(params[:date]))

    respond_to do |f|
      f.json { render json: complete.to_json }
    end
  end

  def destroy
    habit = current_user.habits.find_by_name(params[:name])
    completion = habit.completions.where("date = ?", Date.parse(params[:date]))
    completion.first.destroy

    respond_to do |f|
      f.json { render json: completion.to_json }
    end
  end

end
