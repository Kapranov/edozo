class CreateVisits < ActiveRecord::Migration[5.0]
  def change
    create_table :visits do |t|
      t.string :country
      t.decimal :load_time, precision: 10, scale: 0
      t.datetime :visited_at

      t.timestamps
    end
  end
end
