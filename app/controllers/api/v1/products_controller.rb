class Api::V1::ProductsController < ApplicationController
	respond_to :json

	def create
		product = current_user.products.build(product_params)

		if product.save
			render json: product, status: 201, location: [:api, product]
		else
			render json: { errors: product.errors }, status: 422
		end
	end

	def show
		respond_with Product.find(params[:id])
	end

	def index
	    respond_with Product.all  
	end

	private

		def product_params
			params.require(:product).permit(:title, :price, :published)
		end

end
