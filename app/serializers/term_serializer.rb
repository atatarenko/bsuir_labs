# frozen_string_literal
class TermSerializer < ActiveModel::Serializer
  attributes :id, :course, :number
end