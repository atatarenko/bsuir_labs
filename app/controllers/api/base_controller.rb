# frozen_string_literal
module Api
  class BaseController < ApplicationController
    before_action :check_authorization
    layout false

    private

    def check_authorization
      if current_user.blank?
        head status: 401
      end
    end
  end
end