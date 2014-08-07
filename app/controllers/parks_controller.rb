class ParksController < ApplicationController

	http_basic_authenticate_with name: "Dort", password: "Alien129", except: [:index, :show]

	def new
		@park = Park.new
	end

	def show 
		@park = Park.find(params[:id])
		@activity = Activity.where(:park_id => params[:id])
	end

	def create
	  @park = Park.new(params[:park].permit(:name, :city, :state, :country, :latitude, :longitude, :description))
	 
	 	if @park.save
	  		redirect_to @park
	 	else 
	 		render 'new'
		end
	end

	#def index
	# FUCK YOU	@parks = Park.paginate(page: params[:page],:per_page => 10).search(params[:search])
	#end 

	def edit 
		@park = Park.find(params[:id])
	end

	def update
		@park = Park.find(params[:id])

		if @park.update(params[:park].permit(:name, :city, :state, :country, :latitude, :longitude, :description))
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

	def index
  		if params[:search].present?
    		@parks = Park.near(params[:search], 500).paginate(:page => params[:page], :per_page => 15)
 		 else
    		@parks = Park.near(request.location).paginate(:page => params[:page], :per_page => 15)
  		end
	end


private


	  def park_params
	    params.require(:park).permit(:name, :city, :state, :country, :latitude, :longitude, :description)
	  end
 end