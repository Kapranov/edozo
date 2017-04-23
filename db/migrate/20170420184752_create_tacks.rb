class CreateTacks < ActiveRecord::Migration[5.0]
  def change
    create_table :tacks do |t|
      t.string :title
      t.text :body
      t.references :tick, foreign_key: true

      t.timestamps
    end
  end
end
