class ChangeArtworks < ActiveRecord::Migration[7.0]
  def change
    remove_index :artworks, :title
  end
end
