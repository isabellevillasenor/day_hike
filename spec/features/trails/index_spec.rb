require 'rails_helper'

RSpec.describe 'Trails Index Page' do
  before :each do
    @cherry = Trail.create!(length: 40, name: 'Cherry Creek', address: 'Downtown Denver to Franktown')
    @gods   = Trail.create!(length: 8, name: 'Garden of the Gods', address: 'Colorado Springs')
  end

  describe 'As A Visitor' do

    it 'should have page title and list all hiking trip names' do
      visit '/trails'

      expect(page).to have_content("Some Super Cool Trails")
      expect(page).to have_content(@cherry.name)
      expect(page).to have_content(@gods.name)
    end
    
    it 'should have all trail names as a link that routes to their show page' do
      visit '/trails'

      expect(page).to have_link(@cherry.name)
      click_on "#{@cherry.name}"

      expect(current_path).to eq("/trails/#{@cherry.id}")
    end
  end
end