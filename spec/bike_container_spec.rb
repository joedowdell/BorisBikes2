require 'bike_container'
require 'bike'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do
	
	let(:bike) { Bike.new }
	let(:holder) { ContainerHolder.new }

	def fill_holder
		holder.capacity.times { holder.dock(Bike.new) }
	end

	it 'should accept a bike' do
		expect(holder.bike_count).to eq 0
		holder.dock(bike)
		expect(holder.bike_count).to eq 1
	end

	it "should know when it is full" do
	  expect(holder).not_to be_full
	  fill_holder
	  expect(holder).to be_full
	end

	it 'should release a bike' do
		holder.dock(bike)
		holder.release(bike)
		expect(holder.bike_count).to eq 0
	end

	

	it "should not accept a bike if full" do
		fill_holder
		expect(lambda { holder.dock(bike) }).to raise_error(RuntimeError)
	end

	it 'should provide a list of available bikes' do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq([working_bike])
	end

end