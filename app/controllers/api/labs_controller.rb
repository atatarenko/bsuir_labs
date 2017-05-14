# frozen_string_literal
module Api
  class LabsController < BaseController

    def index
      render json: labs, status: :ok
    end

    def show
      lab = labs.find(params[:id])
      if lab.present?
        render json: lab, status: :ok
      else
        render nothing: true, status: :not_found
      end
    end

    def create
      lab = labs.new(prepare_params)
      if lab.save
        render json: lab, status: :ok
      else
        render json: { errors: lab.errors.messages }, status: :bad_request
      end
    end

    def update
      lab = labs.find(params[:id])
      if lab.present?
        lab.assign_attributes(prepare_params)
        if lab.save
          render json: lab, status: :ok
        else
          render json: { errors: lab.errors.messages }, status: :bad_request
        end
      else
        render nothing: true, status: :not_found
      end
    end

    def destroy
      lab = labs.find(params[:id])
      if lab.present?
        lab.destroy
        render nothing: true, status: :ok
      else
        render nothing: true, status: :not_found
      end
    end

    private

    def prepare_params
      params.permit(:id, :name, :state)
    end

    def labs
      Lab.
        joins(subject: [term: [:user]]).
        where(subjects: {
                term_id: params[:term_id]
              },
              terms: {
                  user_id: current_user.id
              },
              subject_id: params[:subject_id])
    end
  end
end