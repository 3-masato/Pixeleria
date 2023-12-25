class RemovePixelDataFromArtworks < ActiveRecord::Migration[6.1]
  def change
    remove_column :artworks, :pixel_data
    remove_column :artworks, :width
    remove_column :artworks, :height
  end
end
