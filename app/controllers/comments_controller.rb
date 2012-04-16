#encoding: utf-8
class CommentsController < ApplicationController
  def create
    book = Book.find(params[:id])
    comment = book.comments.new(params[:comment])
    comment.user = current_user

    if comment.save
      flash[:notice] = '评论成功'
    else
      flash[:notice] = '评论失败'
    end

    redirect_to book_path(book)
  end
end
