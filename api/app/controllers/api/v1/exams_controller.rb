module Api
  module V1
    class ExamsController < ApplicationController
      def index
        render status: :ok, json: Exam.all
      end

      def import
        csv = params[:upload]

        CsvImportJob.perform_later(csv)
      end
    end
  end
end
