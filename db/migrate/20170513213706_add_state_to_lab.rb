class AddStateToLab < ActiveRecord::Migration[5.0]
  def change
    add_column :labs, :state, :string, null: false
  end
end
