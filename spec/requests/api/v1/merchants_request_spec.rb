require 'rails_helper'

RSpec.describe 'The merchants API' do
  it 'sends a list of all merchants' do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    response_body = JSON.parse(response.body, symbolize_names: true)

    merchants = response_body[:data]

    expect(response).to be_successful
    expect(merchants.count).to eq(3)

    merchants.each do |merchant|
      expect(merchant).to have_key(:id)
      # expect(merchant[:id]).to be_an(Integer)

      expect(merchant).to have_key(:attributes)
      expect(merchant[:attributes][:name]).to be_a(String)
    end
  end

  it 'sends the data of one merchant' do
    merch = create(:merchant)
    create_list(:merchant, 3)

    get "/api/v1/merchants/#{merch.id}"

    response_body = JSON.parse(response.body, symbolize_names: true)

    merchant = response_body[:data]

    expect(response).to be_successful

    expect(merchant[:attributes][:name]).to eq(merch.name)
  end

  it 'sends all items for a given merchant id' do
    merchant = create(:merchant)
    create_list(:item, 10, merchant_id: merchant.id)

    get api_v1_merchant_items_path(merchant_id: merchant.id)

    response_body = JSON.parse(response.body, symbolize_names: true)

    merchant = response_body[:data]

    expect(response).to be_successful

    expect(merchant.count).to eq(10)
  end

  it 'can search for one merchant' do
    merchant = create(:merchant)
    create_list(:item, 10, merchant_id: merchant.id)

    get api_v1_merchant_items_path(merchant_id: merchant.id)

    response_body = JSON.parse(response.body, symbolize_names: true)

    merchant = response_body[:data]

    expect(response).to be_successful

    expect(merchant.count).to eq(10)
  end
end
