class CreateSubject < ActiveRecord::Migration[5.0]
  def change
    create_table :subjects do |t|
      t.string :name, null: false
      t.belongs_to :term, index: true
    end
  end
end
