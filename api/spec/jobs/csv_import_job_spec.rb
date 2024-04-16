require 'rails_helper'
require 'csv'

describe '#perform' do
  it 'creates csv data in the database' do
    csv_path = Rails.root.join('spec/support/assets/test.csv')
    csv_content = CSV.read(csv_path, col_sep: ';')
    
    CsvImportJob.perform_now(csv_content)

    expect(Patient.last.name).to eq 'Emilly Batista Neto'
    expect(Exam.last.token).to eq 'IQCZ17'
    expect(Doctor.last.name).to eq 'Maria Luiza Pires'
  end
end
