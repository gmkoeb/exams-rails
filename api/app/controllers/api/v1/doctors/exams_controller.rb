module Api
  module V1
    module Doctors
      class ExamsController < ApplicationController
        def index
          render status: :ok, json: Doctor.find(params[:doctor_id]).exams
        end
      end
    end
  end
end
