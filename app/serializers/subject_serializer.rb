# frozen_string_literal
class SubjectSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :labs
end