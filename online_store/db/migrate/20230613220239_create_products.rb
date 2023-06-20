class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.string :product_detail
      t.decimal :price
      t.string :location
      t.string :availability
      t.bigint :user_id

      t.timestamps
    end
  end
end
