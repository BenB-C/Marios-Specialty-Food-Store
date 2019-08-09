class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      # products must have a name, cost and country_of_origin
      t.string :name
      t.decimal :cost, precision: 6, scale: 2
      t.string :country_of_origin
      t.timestamps
    end
  end
end
