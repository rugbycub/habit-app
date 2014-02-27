class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :determine_habit

  def create
    user = current_user
    binding.pry
    habit = Habit.find(params[:id])
    post = habit.posts.create(params[:post].permit(:body))
    post.user_id = user.id
    post.save

    respond_to do |f|
      f.json {render json: {post: post.as_json( include: [ :user ]), profile:  user.profile.as_json } }
    end

  end

  def determine_habit
    binding.pry
  end

end
