# frozen_string_literal
module Api
  class TermsController < BaseController

    def index
      render json: current_user.terms, status: :ok
    end

    def show
      term = Term.find_by(id: params[:id], user: current_user)
      if term.present?
        render json: term, status: :ok
      else
        render nothing: true, status: :not_found
      end
    end

    def create
      term = current_user.terms.new(prepare_params)
      if term.save
        render json: term, status: :ok
      else
        render json: { errors: term.errors.messages }, status: :bad_request
      end
    end

    def update
      term = Term.find_by(id: params[:id], user: current_user)
      if term.present?
        term.assign_attributes(prepare_params)
        if term.save
          render json: term, status: :ok
        else
          render json: { errors: term.errors.messages }, status: :bad_request
        end
      else
        render nothing: true, status: :not_found
      end
    end

    def destroy
      term = Term.find_by(id: params[:id], user: current_user)
      if term.present?
        term.destroy
        render nothing: true, status: :ok
      else
        render nothing: true, status: :not_found
      end
    end

    private

    def prepare_params
      params.permit(:id, :course, :number)
    end
  end
end