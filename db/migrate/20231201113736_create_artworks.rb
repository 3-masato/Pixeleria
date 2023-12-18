class CreateArtworks < ActiveRecord::Migration[6.1]
  def change
    create_table :artworks do |t|
      t.references  :user,        null: false, foreign_key: true
      t.string      :title,       null: false
      t.text        :description, null: false
      t.boolean     :is_public,   null: false
      t.text        :vector_data, null: false
      t.integer     :width,       null: false
      t.integer     :height,      null: false

      t.timestamps
    end
  end
end
