module Api
  module V1
    class PatientsController < ApplicationController
      def index
        render status: :ok, json: Patient.all
      end
    end
  end
end
