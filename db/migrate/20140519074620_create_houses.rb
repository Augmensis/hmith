class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :location
      t.decimal :realprice
      t.decimal :fakeprice1
      t.decimal :fakeprice2

      t.timestamps
    end
  end
end
