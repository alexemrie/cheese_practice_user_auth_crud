class CreateCheeses < ActiveRecord::Migration
  def change
    create_table :cheeses do |t|
      t.string :name
      t.decimal :price_per_lb

      t.timestamps null: false
    end
  end
end
