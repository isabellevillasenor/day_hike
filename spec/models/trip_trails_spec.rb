require 'rails_helper'

describe TripTrail do
  describe 'relationships' do
    it { should belong_to :trip }
    it { should belong_to :trail }
  end
end