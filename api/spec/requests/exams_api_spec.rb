require 'rails_helper'
require 'csv'
describe 'Exams API' do
  context 'get api/v1/exams' do
    it 'returns exams list with code 200' do
      doctor = Doctor.create(name: 'Teste', email: 'teste@email.com', crm: '123456', crm_state: 'PR')
      patient = Patient.create(name: 'João', email: 'email@email.com', registration_number: '1342',
                               birth_date: '22/02/2020', address: 'Rua São Sebastião, 181', city: 'Ctba', state: 'PR')
      Exam.create(doctor:, patient:, token: 'ABC123',
                  exam_type: 'Hemácias', type_limits: '41-54', type_result: '50')
      Exam.create(doctor:, patient:, token: 'ABC123',
                  exam_type: 'Urina', type_limits: '45-100', type_result: '45')

      get api_v1_exams_path

      expect(response.status).to eq 200
      expect(response.content_type).to include 'application/json'
      json_response = JSON.parse(response.body)
      expect(json_response.class).to eq Array
      expect(json_response[0]['token']).to include('ABC123')
    end
  end

  context 'post api/v1/exams/import' do
    it 'runs the job to import data from csv file' do
      csv_file = Rails.root.join('spec/support/assets/test.csv')
      csv_content = CSV.read(csv_file, col_sep: ';') 
      csv_import_spy = spy('CsvImportJob')
      stub_const('CsvImportJob', csv_import_spy)

      post api_v1_exams_import_path, params: { file: csv_file }

      expect(csv_import_spy).to have_received(:perform_later).with(csv_content)
      expect(response.status).to eq 200
      json_response = JSON.parse(response.body)
      expect(json_response["message"]).to include('CSV processing started')
    end

    it 'doesnt process invalid files' do
      invalid_file = Rails.root.join('spec/support/assets/dummy.pdf')
      csv_import_spy = spy('CsvImportJob')
      stub_const('CsvImportJob', csv_import_spy)

      post api_v1_exams_import_path, params: { file: invalid_file }
      
      expect(response.status).to eq 400
      json_response = JSON.parse(response.body)
      expect(csv_import_spy).to_not have_received(:perform_later)
      expect(json_response["message"]).to include('Invalid file')
    end
  end
end
