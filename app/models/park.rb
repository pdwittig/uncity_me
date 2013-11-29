class Park < ActiveRecord::Base
	validates :name, presence: true,
					length: { minimum: 5}
	validates :latitude, presence: true
	validates :longitude, presence: true
	attr_writer :name, :city, :state, :country, :latitude, :longitude , :description
	geocoded_by :city 
	after_validation :geocode
	has_many :activities

	#def self.search(search)
	#	if search
	#		find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
	#	else 
	#		find(:all)
	#	end
	#end 



end
