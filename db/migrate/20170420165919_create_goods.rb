class CreateGoods < ActiveRecord::Migration[5.0]
  def change
    create_table :goods do |t|
      t.decimal :subtotal, precision: 11, scale: 2
      t.decimal :tax, precision: 11, scale: 2
      t.decimal :shipping, precision: 11, scale: 2
      t.decimal :total, precision: 11, scale: 2
      t.integer :status

      t.timestamps
    end
  end
end
