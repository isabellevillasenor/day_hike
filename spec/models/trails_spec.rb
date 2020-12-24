require 'rails_helper'

describe Trail do
  describe 'validations' do
    it { should validate_presence_of :length }
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }

    it { should validate_numericality_of(:length).only_integer }
    it { should validate_numericality_of(:length).is_greater_than(0) }
  end

  describe 'relationships' do
    it { should have_many :trips }
    it { should have_many :trip_trails }
  end
end
