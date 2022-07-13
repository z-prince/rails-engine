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

  it 'sends the data of one item' do
    merch1 = create(:merchant)
    merch2 = create(:merchant)
    item1 = create(:item, merchant_id: merch1.id)
    item2 = create(:item, merchant_id: merch2.id)
    item3 = create(:item, merchant_id: merch1.id)

    get "/api/v1/items/#{item3.id}"

    response_body = JSON.parse(response.body, symbolize_names: true)

    item = response_body[:data]

    expect(response).to be_successful

    expect(item[:attributes][:name]).to eq(item3.name)
    expect(item[:attributes][:description]).to eq(item3.description)
    expect(item[:attributes][:unit_price]).to eq(item3.unit_price)
  end
end
