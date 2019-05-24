class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :tables do |t|
      t.string :product
      t.text :description
      t.integer :qty
      t.decimal :price
      t.decimal :total_price

      t.timestamps
    end
  end
end
