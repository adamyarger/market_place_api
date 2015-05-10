class Api::V1::ProductsController < ApplicationController
	respond_to :json

	def show
		respond_with Product.find(params[:id])
	end

end
