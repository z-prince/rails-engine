class Merchant < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :bulk_discounts, dependent: :destroy
  has_many :invoice_items, through: :items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

  def self.search(search_params)
    where('name ILIKE ?', "%#{search_params}%").order(name: :asc).first
  end
end
