module Api
  module V1
    class PatientsController < ApplicationController
      def index
        render status: :ok, json: Patient.all
      end

      def exams
        render status: :ok, json: Patient.find(params[:patient_id]).exams
      end
    end
  end
end
