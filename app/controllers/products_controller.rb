class ProductsController < ApplicationController
  def index
    # @products = Product.page(params[:page]).per(20).order("id ASC")
  	    # 検索フォームの入力内容で検索する
  end

  def show
  	@product = Product.find(params[:id])
  end
end