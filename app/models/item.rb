class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.search(search_params)
    where('name ILIKE ?', "%#{search_params}%").order(name: :asc)
  end
end
