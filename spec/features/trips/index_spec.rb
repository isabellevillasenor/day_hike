require 'rails_helper'

RSpec.describe 'Trips Index Page' do
  before :each do
    @t1 = Trip.create!(name: 'Trip 1', start_date: '2020-02-02 08:00:00', end_date: '2020-02-02 17:00:00')
    @t2 = Trip.create!(name: 'Trip 2', start_date: '2020-02-02 08:00:00', end_date: '2020-02-02 17:00:00')
  end

  describe 'As A Visitor' do

    it 'should have page title and list all hiking trip names' do
      visit '/trips'

      expect(page).to have_content("Pick Your Trip!")
      expect(page).to have_content(@t1.name)
      expect(page).to have_content(@t2.name)
    end
    
    it 'should have all trail names as a link that routes to their show page' do
      visit '/trips'

      expect(page).to have_link(@t1.name)
      click_on "#{@t1.name}"

      expect(current_path).to eq("/trips/#{@t1.id}")
    end
  end
end