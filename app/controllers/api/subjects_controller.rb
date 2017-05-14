# frozen_string_literal
module Api
  class SubjectsController < BaseController

    def index
      render json: subjects, status: :ok
    end

    def show
      subject = subjects.find(params[:id])
      if subject.present?
        render json: subject, status: :ok
      else
        render nothing: true, status: :not_found
      end
    end

    def create
      subject = subjects.new(prepare_params)
      if subject.save
        render json: subject, status: :ok
      else
        render json: { errors: subject.errors.messages }, status: :bad_request
      end
    end

    def update
      subject = subjects.find(params[:id])
      if subject.present?
        subject.assign_attributes(prepare_params)
        if subject.save
          render json: subject, status: :ok
        else
          render json: { errors: subject.errors.messages }, status: :bad_request
        end
      else
        render nothing: true, status: :not_found
      end
    end

    def destroy
      subject = subjects.find(params[:id])
      if subject.present?
        subject.destroy
        render nothing: true, status: :ok
      else
        render nothing: true, status: :not_found
      end
    end

    private

    def prepare_params
      params.
          merge(labs_attributes: params.delete(:labs)).
          permit(:id, :name, :description, labs_attributes: %i[id rank])
    end

    def subjects
      Subject.
          joins(term: [:user]).
          where(terms: { user_id: current_user.id }, term_id: params[:term_id])
    end
  end
end