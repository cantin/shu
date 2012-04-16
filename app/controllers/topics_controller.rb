class TopicsController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:index, :show]

  def index
    @topics = Topic.includes(:user).page(params[:page]).per(20)
  end

  def show
    @topic = Topic.find(params[:id])
  end
end
