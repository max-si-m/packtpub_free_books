class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :image
      t.text :description
      t.integer :views, default: 0
      t.integer :downloads, default: 0

      t.timestamps null: false
    end
  end
end
