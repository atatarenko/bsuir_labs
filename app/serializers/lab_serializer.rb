# frozen_string_literal
class LabSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :state, :subject_id, :rank
  belongs_to :subject
end