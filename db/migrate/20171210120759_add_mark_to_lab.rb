class AddMarkToLab < ActiveRecord::Migration[5.0]
  def change
    create_table :marks do |t|
      t.integer :value, uniq: true
    end

    add_reference :labs, :mark, index: true
  end
end
