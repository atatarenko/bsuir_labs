class AddTeacherReferenceToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :teachers, :user, index: true
  end
end
