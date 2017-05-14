# frozen_string_literal
class LabSerializer < ActiveModel::Serializer
  attributes :id, :name, :state
  belongs_to :subject
end