# frozen_string_literal
module Api
  class BaseController < ApplicationController
    before_action :check_authorization
    layout false

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    private

    def check_authorization
      if current_user.blank?
        head status: 401
      end
    end

    def render_not_found
      head :not_found
    end
  end
end
