# frozen_string_literal
class TeacherSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :subjects
end
