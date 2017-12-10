# frozen_string_literal
module Api
  class TeachersController < BaseController
    def index
      render json: teachers, status: :ok
    end

    def show
      render json: teacher, status: :ok
    end

    def create
      if new_teacher.save
        render json: new_teacher, status: :ok
      else
        render json: { errors: new_teacher.errors.messages }, status: :bad_request
      end
    end

    def update
      teacher.assign_attributes(prepare_params)
      if teacher.save
        render json: teacher, status: :ok
      else
        render json: { errors: teacher.errors.messages }, status: :bad_request
      end
    end

    def destroy
      teacher.destroy
      render nothing: true, status: :ok
    end

    private

    def prepare_params
      params.permit(:id, :name)
    end

    def new_teacher
      @new_teacher ||= teachers.new(prepare_params)
    end

    def teacher
      @teacher ||= teachers.find(params[:id])
    end

    delegate :teachers, to: :current_user
  end
end
