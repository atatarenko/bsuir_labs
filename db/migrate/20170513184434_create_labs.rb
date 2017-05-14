class CreateLabs < ActiveRecord::Migration[5.0]
  def change
    create_table :labs do |t|
      t.string :name, null: :false
      t.belongs_to :subject
    end
  end
end
