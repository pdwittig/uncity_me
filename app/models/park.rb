class Park < ActiveRecord::Base
	validates :name, presence: true,
					length: { minimum: 5}
	validates :latitude, presence: true
	validates :longitude, presence: true

	def self.search(search)
		if search
			find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
		else 
			find(:all)
		end
	end 



end
