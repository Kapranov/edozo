class CreateFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.decimal :price, precision: 12, scale: 2

      t.timestamps
    end
  end
end
