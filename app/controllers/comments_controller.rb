class CommentsController < ApplicationController

  def create
      @comment = Comment.create(text: comment_params[:text], topic_id: comment_params[:topic_id], user_id: current_user.id)
      respond_to do |format|
        format.html { redirect_to topic_path(params[:topic_id]) }
        format.json
      end
  end

  private
  def comment_params
    params.permit(:text, :topic_id)
  end
end
