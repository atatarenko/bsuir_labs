# frozen_string_literal
class LabSerializer < ActiveModel::Serializer
  attributes :id, :name, :state, :subject_id
  belongs_to :subject
end