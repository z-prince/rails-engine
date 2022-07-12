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
    merchant1 = Merchant.create!(name: 'Sal Salisbury')
    Merchant.create!(name: 'Rip Ramwinkle')
    Merchant.create!(name: 'Tom Bologna')

    get "/api/v1/merchants/#{merchant1.id}"

    response_body = JSON.parse(response.body, symbolize_names: true)

    merchant = response_body[:data]

    expect(response).to be_successful

    expect(merchant[:attributes][:name]).to_not eq('Rip Ramwinkle')
    expect(merchant[:attributes][:name]).to_not eq('Tom Bologna')
    expect(merchant[:attributes][:name]).to eq('Sal Salisbury')
  end
end
