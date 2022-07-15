require 'rails_helper'

RSpec.describe Merchant do
  describe 'relationships' do
    it { should have_many :items }
  end

  describe 'class methods' do
    it 'can search for items' do
      merch1 = Merchant.create!(name: 'Sal Stuff')
      merch2 = Merchant.create!(name: 'Xavier Clam')
      merch3 = Merchant.create!(name: 'Ben Benioff')

      expect(Merchant.search('X')).to eq(merch2)
    end
  end
end
