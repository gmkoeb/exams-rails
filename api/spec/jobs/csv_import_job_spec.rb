require 'rails_helper'

describe '#perform' do
  it 'creates csv data in the database' do
    csv = Rails.root.join('spec/support/assets/test.csv')

    CsvImportJob.perform_now(csv)

    expect(Patient.last.name).to eq 'Emilly Batista Neto'
    expect(Exam.last.token).to eq 'IQCZ17'
    expect(Doctor.last.name).to eq 'Maria Luiza Pires'
  end
end
