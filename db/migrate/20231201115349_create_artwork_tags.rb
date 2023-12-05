class CreateArtworkTags < ActiveRecord::Migration[6.1]
  def change
    create_table :artwork_tags do |t|
      t.references :artwork, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
    add_index :artwork_tags, [:artwork_id, :tag_id], unique: true
  end
end
