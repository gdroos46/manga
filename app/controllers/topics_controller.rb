class TopicsController < ApplicationController
	def new
		@product = Product.find(params[:product_id])
		@topic = Topic.new
	end

	def create
		Topic.create(create_params)
		redirect_to product_path(id: params[:product_id])
	end

	def show
		@topic = Topic.find(params[:id])
		@comments = @topic.comments.includes(:user)
	end

	def edit
		@topic = Topic.find(params[:id])
	end

	def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy if @topic.user_id == current_user.id
    redirect_to product_path(id: @topic.product)
	end

	def update
    @topic = Topic.find(params[:id])
    if @topic.user_id == current_user.id
      @topic.update(topic_title_params)
    end
    redirect_to product_path(id: @topic.product)

	end

	private
	def topic_title_params
  	params.require(:topic).permit(:topic_title)
  end

  def create_params
    params.require(:topic).permit(:topic_title).merge(product_id: params[:product_id], user_id: current_user.id)
  end
end

