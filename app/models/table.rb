class Table < ApplicationRecord
  belongs_to :user
  def total_price
    qty.to_f * price.to_f
  end
end
