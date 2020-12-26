require 'rails_helper'

RSpec.describe 'Trails Show Page' do
  before :each do
    @t1 = Trip.create!(name: 'Trip 1', start_date: '2020-02-02 08:00:00', end_date: '2020-02-02 17:00:00')
    @t2 = Trip.create!(name: 'Trip 2', start_date: '2020-02-02 08:00:00', end_date: '2020-02-02 17:00:00')

    @cherry = Trail.create!(length: 40, name: 'Cherry Creek', address: 'Downtown Denver to Franktown')
    @falcon = Trail.create!(length: 10, name: 'Mount Falcon', address: 'Morrison')
    @chaut = Trail.create!(length: 6, name: 'Chautauqua Park', address: 'Boulder')
    @gods = Trail.create!(length: 8, name: 'Garden of the Gods', address: 'Colorado Springs')


    TripTrail.create!(trail: @cherry, trip: @t1)
    TripTrail.create!(trail: @falcon, trip: @t1)

    TripTrail.create!(trail: @cherry, trip: @t2)
    TripTrail.create!(trail: @chaut, trip: @t2)
    TripTrail.create!(trail: @gods, trip: @t2)
  end

  describe 'As A Visitor' do
    it 'should show the name, length and address' do
      visit "/trails/#{@cherry.id}"

      expect(page).to have_content(@cherry.name)
      expect(page).to have_content(@cherry.length)
      expect(page).to have_content(@cherry.address)
    end

    it 'should show all trip names the trail is included in and that trips total length' do
      visit "/trails/#{@cherry.id}"

      expect(page).to have_content(@t1.name)
      expect(page).to have_content(@t1.total_distance)
      expect(@t1.total_distance).to eq(50)

      expect(page).to have_content(@t2.name)
      expect(page).to have_content(@t2.total_distance)
      expect(@t2.total_distance).to eq(54)
    end
  end
end