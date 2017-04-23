class CreateAtoms < ActiveRecord::Migration[5.0]
  def change
    create_table :atoms do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
