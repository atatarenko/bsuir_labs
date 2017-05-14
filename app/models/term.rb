# frozen_string_literal
class Term < ApplicationRecord
  belongs_to :user
  has_many :subjects, dependent: :destroy

  validates :course, presence: true
  validates :number, presence: true
end
