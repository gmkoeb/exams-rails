require 'rails_helper'
require 'csv'

describe '#perform' do
  it 'creates csv data in the database' do
    csv_path = Rails.root.join('spec/support/assets/test.csv')
    csv_content = CSV.read(csv_path, col_sep: ';')
    status = JobStatus.create

    CsvImportJob.perform_now(csv_content, status.token)

    expect(Patient.last.name).to eq 'Emilly Batista Neto'
    expect(Exam.last.token).to eq 'IQCZ17'
    expect(Doctor.last.name).to eq 'Maria Luiza Pires'
  end

  it 'sets the related job status status to done' do
    csv_path = Rails.root.join('spec/support/assets/test.csv')
    csv_content = CSV.read(csv_path, col_sep: ';')
    status = JobStatus.create

    CsvImportJob.perform_now(csv_content, status.token)

    expect(JobStatus.last.status).to eq 'done'
  end
end
