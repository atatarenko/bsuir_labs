# frozen_string_literal
class Lab < ApplicationRecord
  include LabStates
  belongs_to :subject

  validates :name, presence: true, length: { maximum: 23 }
  validates :state, presence: true
  validates :rank, presence: true

  scope :ordered_by_rank, -> { order(rank: :asc) }
end
