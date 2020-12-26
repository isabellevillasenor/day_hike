require 'rails_helper'

RSpec.describe 'Trips Show Page' do
  before :each do
    @t1 = Trip.create!(name: 'Trip 1', start_date: '2020-02-02 08:00:00', end_date: '2020-02-02 17:00:00')
    @t2 = Trip.create!(name: 'Trip 2', start_date: '2020-02-02 08:00:00', end_date: '2020-02-02 17:00:00')

    @cherry = Trail.create!(length: 40, name: 'Cherry Creek', address: 'Downtown Denver to Franktown')
    @falcon = Trail.create!(length: 10, name: 'Mount Falcon', address: 'Morrison')

    TripTrail.create!(trail: @cherry, trip: @t1)
    TripTrail.create!(trail: @falcon, trip: @t1)
  end

  describe 'As A Visitor' do

    it 'should show the name start date and end date' do
      visit "/trips/#{@t1.id}"

      expect(page).to have_content(@t1.name)
      expect(page).to have_content(@t1.start_date)
      expect(page).to have_content(@t1.end_date)

      expect(page).to_not have_content(@t2.name)
    end

    it 'should display the total hiking distance of all trails on the trip' do
      visit "/trips/#{@t1.id}"

      expect(page).to have_content(@t1.total_distance)
      expect(@t1.total_distance).to eq(50)
    end

    it 'should display the average distance of all trails on the trip' do
      visit "/trips/#{@t1.id}"

      expect(page).to have_content(@t1.average_distance)
      expect(@t1.average_distance).to eq(25)
    end
    
    it 'should display the longest trail on the trip' do
      visit "/trips/#{@t1.id}"

      expect(page).to have_content("Longest Trail on #{@t1.name}")
      expect(page).to have_content(@t1.longest_trail.name)
      expect(@t1.longest_trail.name).to eq(@cherry.name)

      expect(page).to have_content(@t1.longest_trail.length)
      expect(@t1.longest_trail.length).to eq(@cherry.length)
    end

    it 'should display the shortest trail on the trip' do
      visit "/trips/#{@t1.id}"

      expect(page).to have_content("Shortest Trail on #{@t1.name}")
      expect(page).to have_content(@t1.shortest_trail.name)
      expect(@t1.shortest_trail.name).to eq(@falcon.name)

      expect(page).to have_content(@t1.shortest_trail.length)
      expect(@t1.shortest_trail.length).to eq(@falcon.length)
    end

    it 'should have links on trail names that reroute to that trails show page' do
      visit "/trips/#{@t1.id}"

      expect(page).to have_link(@cherry.name)
      click_on(@cherry.name)

      expect(current_path).to eq("/trails/#{@cherry.id}")
      expect(page).to have_content(@cherry.name)
      expect(page).to have_content(@cherry.length)  
      expect(page).to have_content(@cherry.address)  
    end
  end
end