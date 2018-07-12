class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

	before_action :set_search

	def set_search
  	# 検索フォームの入力内容で検索する
  	@q = Product.search(params[:q])

    # 重複を排除
    @products = @q.result(distinct: true).page(params[:page])
	end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    end
end
