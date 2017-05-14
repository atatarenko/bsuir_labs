# frozen_string_literal
class Term < ApplicationRecord
  belongs_to :user
  has_many :subjects, dependent: :destroy

  validates :course, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :term_number, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :term_number, uniqueness: { scope: %i[course user] }

  scope :ordered, -> { order(:course, :term_number) }
end
