# frozen_string_literal
class SubjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_many :labs

  def labs
    object.labs.ordered_by_rank
  end
end