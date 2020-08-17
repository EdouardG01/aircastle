class CreateCastles < ActiveRecord::Migration[6.0]
  def change
    create_table :castles do |t|
      t.string :name
      t.text :description
      t.string :address
      t.float :price_per_day
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
