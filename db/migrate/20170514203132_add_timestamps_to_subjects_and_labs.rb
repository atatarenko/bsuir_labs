class AddTimestampsToSubjectsAndLabs < ActiveRecord::Migration[5.0]
  def change
    change_table(:subjects) { |t| t.timestamps }
    change_table(:labs) { |t| t.timestamps }
  end
end
