require 'rails_helper'

RSpec.describe 'The items API' do
  it 'sends a list of all items' do
    merch1 = create(:merchant)
    merch2 = create(:merchant)
    create_list(:item, 10, merchant_id: merch1.id)
    create_list(:item, 10, merchant_id: merch2.id)

    get '/api/v1/items'

    response_body = JSON.parse(response.body, symbolize_names: true)

    items = response_body[:data]

    expect(response).to be_successful
    expect(items.count).to eq(20)

    items.each do |item|
      expect(item).to have_key(:id)

      expect(item).to have_key(:attributes)
      expect(item[:attributes][:name]).to be_a(String)
      expect(item[:attributes][:description]).to be_a(String)
      expect(item[:attributes][:unit_price]).to be_a(Float)
    end
  end
end
