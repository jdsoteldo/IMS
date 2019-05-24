class Table < ApplicationRecord
  def total_price
    qty.to_f * price.to_f
  end
end
