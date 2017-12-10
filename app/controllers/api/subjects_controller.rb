# frozen_string_literal
module Api
  class SubjectsController < BaseController
    def index
      render json: subjects, status: :ok
    end

    def show
      render json: subject, status: :ok
    end

    def create
      if new_subject.save
        render json: new_subject, status: :ok
      else
        render json: { errors: new_subject.errors.messages }, status: :bad_request
      end
    end

    def update
      subject.assign_attributes(prepare_params)
      if subject.save
        render json: subject, status: :ok
      else
        render json: { errors: subject.errors.messages }, status: :bad_request
      end
    end

    def destroy
      subject.destroy
      head :ok
    end

    private

    def subject
      @subject ||= subjects.find(params[:id])
    end

    def new_subject
      @new_subject ||= subjects.new(prepare_params)
    end

    def prepare_params
      params
        .merge(labs_attributes: params.delete(:labs))
        .permit(:id, :name, :description, :teacher_id, labs_attributes: %i[id rank])
    end

    def subjects
      Subject
        .joins(term: [:user])
        .where(terms: { user_id: current_user.id }, term_id: params[:term_id])
        .order(:created_at)
    end
  end
end
