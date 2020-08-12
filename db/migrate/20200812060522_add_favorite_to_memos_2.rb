class AddFavoriteToMemos2 < ActiveRecord::Migration[5.1]
  def change
    remove_column :memos, :favorite, :integer
    add_column :memos, :like, :integer
  end
end
