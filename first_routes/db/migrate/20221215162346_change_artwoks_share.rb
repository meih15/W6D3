class ChangeArtwoksShare < ActiveRecord::Migration[7.0]
  def change
    remove_column :artwork_shares, :artwork_id
    remove_column :artwork_shares, :viewer_id
  end
end
