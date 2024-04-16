module Api
  module V1
    class ExamsController < ApplicationController
      def index
        render status: :ok, json: Exam.all
      end

      def import
        process_file(params[:file])
      end


      private

      def process_file(file)
        if File.extname(file) == '.csv'
            rows = CSV.read(file, col_sep: ';')
            CsvImportJob.new.perform_later(rows)
            render status: 200, json: { message: 'CSV processing started' }
        else
          render status: 400, json: { message: 'Invalid file' }
        end
      end

    end
  end
end
