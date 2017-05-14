class AddColumnRankToLab < ActiveRecord::Migration[5.0]
  def change
    add_column :labs, :rank, :integer, default: 0, null: false
    add_column :labs, :description, :string, default: '', null: false
    add_column :subjects, :description, :string, default: '', null: false
  end
end
