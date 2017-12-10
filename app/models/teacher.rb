# frozen_string_literal
class Teacher < ApplicationRecord
  belongs_to :user
  has_many :subjects
end
