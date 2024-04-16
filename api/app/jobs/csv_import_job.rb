class CsvImportJob < ApplicationJob
  include Sidekiq

  after_perform do |job|
    JobStatus.find_by(token: job.arguments.last).done!
  end
  
  def perform(rows, token)
    ImportFromCsv.new.import(rows)
  end
end
