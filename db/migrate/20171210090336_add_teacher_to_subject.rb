class AddTeacherToSubject < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
      t.string :name, null: false
    end

    add_reference :subjects, :teacher, index: true
  end
end
