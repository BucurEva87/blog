class AddRefUsersAndPostsToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :author, foreign_key: { to_table: :users }, null: false
    add_reference :likes, :post, foreign_key: { to_table: :posts }
  end
end
