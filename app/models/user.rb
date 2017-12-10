# frozen_string_literal
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :terms, dependent: :destroy
  has_many :teachers, dependent: :destroy

  validates :email, presence: true, length: { maximum: 20 }
end
