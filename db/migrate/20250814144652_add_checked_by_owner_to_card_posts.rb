class AddCheckedByOwnerToCardPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :card_posts, :checked_by_owner, :boolean, default: false
  end
end
