module Api
  module V1
    class ExamsController < ApplicationController
      require 'csv'

      def index
        render status: :ok, json: Exam.all
      end

      def import
        process_file(params[:file])
      end

      def import_status
        job = JobStatus.find_by(token: params[:token])
        render status: 200, json: { status: job.status, processed_rows: job.processed_rows}
      end

      private

      def process_file(file)
        if File.extname(file) == '.csv'
            rows = CSV.read(file, col_sep: ';')
            status = JobStatus.create
            CsvImportJob.perform_later(rows, status.token)
            render status: 200, json: { message: 'CSV processing started', token: status.token, rows_to_process: rows.count }
        else
          render status: 400, json: { message: 'Invalid file' }
        end
      end
    end
  end
end
