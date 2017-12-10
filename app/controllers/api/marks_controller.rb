# frozen_string_literal
module Api
  class MarksController < BaseController
    def index
      render json: Mark.order(value: :desc), status: :ok
    end
  end
end
