class CommentsController < ApplicationController

	def new
    @topic = Topic.find(params[:product_id])
    @comment = Comment.new
	end

	def create
		Comment.create(create_params)
	end

  private
  def create_params
    params.require(:comment).permit(:text).merge(topic_id: params[:topic_id], user_id: current_user.id)
  end
end
