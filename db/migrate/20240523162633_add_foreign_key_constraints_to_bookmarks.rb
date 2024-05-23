class AddForeignKeyConstraintsToBookmarks < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :bookmarks, :movies
    remove_foreign_key :bookmarks, :lists

    add_foreign_key :bookmarks, :movies, on_delete: :restrict
    add_foreign_key :bookmarks, :lists, on_delete: :restrict
  end
end
