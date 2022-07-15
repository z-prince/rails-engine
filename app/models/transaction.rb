class Transaction < ApplicationRecord
  belongs_to :invoice
  has_many :invoice_items, through: :invoice

  enum result: %w[success failed]
end
