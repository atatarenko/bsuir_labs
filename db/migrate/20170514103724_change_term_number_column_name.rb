class ChangeTermNumberColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :terms, :number, :term_number
  end
end
