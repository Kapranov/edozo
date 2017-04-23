class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.float  :average_rating
      t.decimal :price, precision: 12, scale: 2
      t.boolean :active

      t.timestamps
    end
  end
end
