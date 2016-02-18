class Concert < ActiveRecord::Base
	has_many :comments
	
	validates :artist, presence: :true
	validates :venue, presence: :true
	validates :city, presence: :true
	validates :date, presence: :true
	validate  :happened_after_today?
	validates :price, presence: :true, numericality: { greater_than_or_equal_to: 0}

private
	def happened_after_today?
		today = DateTime.now

		if self.date < today
			errors.add(:date, "That is not a date in the future. There is no timetravel.")
		end
	end
end
