# frozen_string_literal: true
module LabStates
  extend ActiveSupport::Concern

  included do
    include AASM

    aasm column: :state do
      state :todo, initial: true
      state :in_progress
      state :resolved
      state :finish

      event :get_to_work do
        transitions from: :any, to: :in_progress
      end

      event :suspend_work do
        transitions from: :any, to: :todo
      end

      event :resolve do
        transitions from: :any, to: :resolved
      end

      event :finish do
        transitions from: :any, to: :done
      end
    end
  end
end