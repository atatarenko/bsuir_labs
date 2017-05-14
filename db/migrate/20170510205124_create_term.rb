class CreateTerm < ActiveRecord::Migration[5.0]
  def change
    create_table :terms do |t|
      t.integer :course, null: false
      t.integer :number, null: false
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
