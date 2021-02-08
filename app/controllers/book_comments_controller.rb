class BookCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    @comment = @book.book_comments.build(book_comment_params)
    @comment.user_id = current_user.id
    @comment.save
    render :index
  end
  
  def destroy
    @comment = BookComment.find(params[:id])
    @comment.destroy
    render :index
  end
  
  private
  
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
