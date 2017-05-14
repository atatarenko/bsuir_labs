# frozen_string_literal
class Subject < ApplicationRecord
  belongs_to :term
  has_many :labs, dependent: :destroy

  validates :name, presence: true
end
