class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.string :category
      t.string :location
      t.integer :price
      t.datetime :date

      t.timestamps
    end
  end
end
