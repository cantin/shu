class TopicsController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @topics = Topic.includes(:user).page(params[:page]).per(20)
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def tags
    @topics = Topic.tagged_with(params[:name]).page(params[:page]).per(20)

    render 'topics/index'
  end
end
