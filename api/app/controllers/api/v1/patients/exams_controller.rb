module Api
  module V1
    module Patients
      class ExamsController < ApplicationController
        def index
          render status: :ok, json: Patient.find(params[:patient_id]).exams
        end
      end
    end
  end
end
