class DockingStation

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes = []
	end

	def bike_count
		@bikes.count
	end

	def dock(bike)
		raise "Sorry, the station is full" if full?
		@bikes << bike
	end

	def release(bike)
		@bikes.delete(bike)
	end

	def full?
		bike_count == @capacity
	end

	def available_bikes
		@bikes.reject {|bike| bike.broken? }
	end



end