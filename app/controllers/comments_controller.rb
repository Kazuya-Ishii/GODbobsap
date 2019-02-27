class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.topic_id = params[:comment][:topic_id]

    if @comment.save
      redirect_to topics_path, success: 'コメントに登録したよ'
    else
      redirect_to new_comment_path, danger: 'コメントの投稿に失敗しました'
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:image, :description)
      #code
    end
end
