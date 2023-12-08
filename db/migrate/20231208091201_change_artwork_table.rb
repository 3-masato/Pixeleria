class ChangeArtworkTable < ActiveRecord::Migration[6.1]
  def change
    rename_column :artworks, :vector_data, :pixel_data
    change_column_null :artworks, :description, true
  end
end
