class CreateItemReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :item_reviews do |t|
      t.string :title
      t.text :body
      t.references :item, index: true, foreign_key: true

      t.timestamps
    end
  end
end
