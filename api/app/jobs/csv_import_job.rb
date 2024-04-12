class CsvImportJob < ApplicationJob
  include Sidekiq

  def perform(csv)
    ImportFromCsv.new.import(csv)
  end
end
