class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.references  :reportable, polymorphic: true, null: false
      t.integer     :reported_by_user_id, null: false
      t.integer     :reason,              null: false
      t.text        :description,         null: false
      t.integer     :status,              null: false

      t.timestamps
    end
  end
end
