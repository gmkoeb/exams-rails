module Api
  module V1
    class DoctorsController < ApplicationController
      def index
        render status: :ok, json: Doctor.all
      end

      def exams
        render status: :ok, json: Doctor.find(params[:doctor_id]).exams
      end
    end
  end
end
