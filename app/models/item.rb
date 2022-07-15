class Item < ApplicationRecord
  belongs_to :merchant

  def self.search(search_params)
    where('name ILIKE ?', "%#{search_params}%").order(name: :asc)
  end
end
