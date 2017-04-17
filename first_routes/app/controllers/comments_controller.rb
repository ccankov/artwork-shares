class CommentsController < ApplicationController
  def index
    comment = Comment.find_by(comment_params)
    render json: comment
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render(
        json: comment.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.destroy
      render json: comment
    else
      render(
        json: comment.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :artwork_id)
  end
end
