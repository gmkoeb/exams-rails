class CsvImportJob < ApplicationJob
  include Sidekiq

  def perform(rows)
    ImportFromCsv.new.import(rows)
  end
end
