class CreateArtworkCanvases < ActiveRecord::Migration[6.1]
  def change
    create_table :artwork_canvases do |t|
      t.references  :artwork,     null: false, foreign_key: true
      t.text        :pixel_data,  null: false
      t.integer     :width,       null: false
      t.integer     :height,      null: false

      t.timestamps
    end
  end
end
