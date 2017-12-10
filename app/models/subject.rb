# frozen_string_literal
class Subject < ApplicationRecord
  belongs_to :term
  belongs_to :teacher, optional: true
  belongs_to :mark, optional: true
  has_many :labs, dependent: :destroy

  validates :name, presence: true

  accepts_nested_attributes_for :labs, allow_destroy: true
end
