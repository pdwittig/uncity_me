class ParksController < ApplicationController

	http_basic_authenticate_with name: "Dort", password: "Alien129", except: [:index, :show]

	def new
		@park = Park.new
	end

	def show 
		@park = Park.find(params[:id])
	end

	def create
	  @park = Park.new(params[:park].permit(:name, :city, :state, :country, :latitude, :longitude))
	 
	 	if @park.save
	  		redirect_to @park
	 	else 
	 		render 'new'
		end
	end

	def index
		@parks = Park.paginate(page: params[:page],:per_page => 10).search(params[:search])
	end 

	def edit 
		@park = Park.find(params[:id])
	end

	def update
		@park = Park.find(params[:id])

		if @park.update(params[:park].permit(:name, :city, :state, :country, :latitude, :longitude))
			redirect_to @park
		else
			render 'edit'
		end
	end

	def destroy
		@park = Park.find(params[:id])
		@park.destroy

		redirect_to parks_path
	end

private


	  def park_params
	    params.require(:park).permit(:name, :city, :state, :country, :latitude, :longitude)
	  end
 end