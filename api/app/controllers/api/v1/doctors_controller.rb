module Api
  module V1
    class DoctorsController < ApplicationController
      def index
        render status: :ok, json: Doctor.all
      end
    end
  end
end
