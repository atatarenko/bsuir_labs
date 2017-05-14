# frozen_string_literal
module Api
  class BaseController < ApplicationController
    before_action :check_authorization

    private

    def check_authorization
      if current_user.blank?
        render no_content: true, status: 401
      end
    end
  end
end