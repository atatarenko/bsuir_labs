class AddDefaultMarks < ActiveRecord::Migration[5.0]
  def up
    default_marks.each do |mark|
      Mark.create(value: mark)
    end
  end

  def down
    Mark.where(value: default_marks).destroy_all
  end

  private

  def default_marks
    (1..10)
  end
end
