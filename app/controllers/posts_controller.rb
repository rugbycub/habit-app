class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = current_user
    habit = user.habits.find_by_name(params[:habit])

    post = user.create_post(params[:post])
    post.habit_id = habit.id
    post.save

    respond_to do |f|
      f.json {render json: post.to_json}
    end

  end
  
end
