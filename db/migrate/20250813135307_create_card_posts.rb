class CreateCardPosts < ActiveRecord::Migration[7.1]
  def change
    create_table :card_posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :store_name
      t.string :card_name
      t.integer :price
      t.text :memo
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
