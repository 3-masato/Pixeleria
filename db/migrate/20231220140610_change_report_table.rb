class ChangeReportTable < ActiveRecord::Migration[6.1]
  def up
    add_column :reports, :is_read, :boolean, default: false
    change_column :reports, :status, :integer, default: 0
    change_column_null :reports, :description, true
  end
end
