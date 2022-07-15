require 'rails_helper'

RSpec.describe Item do
  describe 'relationships' do
    it { should belong_to :merchant }
  end

  describe 'class methods' do
    it 'can search for items' do
      merch = Merchant.create!(name: 'Sal Stuff')
      Item.create!(name: 'Goop', description: 'You do not want to know.', unit_price: 34.21, merchant_id: merch.id)
      item2 = Item.create!(name: 'Floop', description: 'You do not want to know.', unit_price: 24.21,
                           merchant_id: merch.id)
      Item.create!(name: 'Boop', description: 'You do not want to know.', unit_price: 444.21, merchant_id: merch.id)

      expect(Item.search('F').first).to eq(item2)
    end
  end
end
