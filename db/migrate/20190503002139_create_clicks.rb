class CreateClicks < ActiveRecord::Migration[5.2]
  def change
    create_table :clicks do |t|

      t.timestamps
    end
  end
end
