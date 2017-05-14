# frozen_string_literal
class TermSerializer < ActiveModel::Serializer
  attributes :id, :course, :term_number
end