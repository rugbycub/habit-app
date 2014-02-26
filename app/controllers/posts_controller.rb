class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = current_user
    habit = user.habits.find_by_name(params[:name])

    post = habit.posts.create(params[:post].permit(:body))
    post.user_id = user.id
    post.save

    respond_to do |f|
      f.json {render json: {post: post.as_json( include: [ :user ]), profile:  user.profile.as_json } }
    end

  end

end
