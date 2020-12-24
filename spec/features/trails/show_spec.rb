require 'rails_helper'

RSpec.describe 'Trails Show Page' do
  before :each do
    @cherry = Trail.create!(length: 40, name: 'Cherry Creek', address: 'Downtown Denver to Franktown')
    @gods   = Trail.create!(length: 8, name: 'Garden of the Gods', address: 'Colorado Springs')
  end
  describe 'As A Visitor' do
    it 'should show the name, length and address' do
      visit "/trails/#{@cherry.id}"

      expect(page).to have_content(@cherry.name)
      expect(page).to have_content(@cherry.length)
      expect(page).to have_content(@cherry.address)
    end
  end
end