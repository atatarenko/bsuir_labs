class AddTimestampsToTeacher < ActiveRecord::Migration[5.0]
  def change
    change_table(:teachers, &:timestamps)
  end
end
