# frozen_string_literal
class Lab < ApplicationRecord
  include LabStates
  belongs_to :subject

  validates :name, presence: true
  validates :state, presence: true
end
