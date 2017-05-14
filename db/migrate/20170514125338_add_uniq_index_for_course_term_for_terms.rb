class AddUniqIndexForCourseTermForTerms < ActiveRecord::Migration[5.0]
  def change
    add_index :terms, %i[user_id course term_number], unique: true
  end
end
