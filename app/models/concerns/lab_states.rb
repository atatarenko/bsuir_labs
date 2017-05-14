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
        transitions to: :in_progress
      end

      event :suspend_work do
        transitions to: :todo
      end

      event :resolve do
        transitions to: :resolved
      end

      event :finish do
        transitions to: :done
      end
    end
  end
end