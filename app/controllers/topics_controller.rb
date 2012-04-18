#encoding: utf-8
class TopicsController < ApplicationController
  skip_before_filter :authenticate_user!, except: [:new, :create]

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

  def new
    @topic = Topic.new
    @tags = Topic.tag_counts_on(:tags)
  end

  def create
    @topic = Topic.new(params[:topic])
    @topic.user = current_user

    if @topic.save
      flash[:notice] = '创建主题成功'
      redirect_to topics_tag_path(@topic.tags.first.name)
    else
      flash[:notice] = '创建主题失败'
      redirect_to '/topics/new'
    end
  end
end
