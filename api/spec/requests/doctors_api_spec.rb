require 'rails_helper'

describe 'Doctors API' do
  context 'get api/v1/doctors' do
    it 'return doctors list with status 200' do
      Doctor.create(name: 'Teste', email: 'teste@email.com', crm: '123456', crm_state: 'PR')

      get api_v1_doctors_path

      expect(response.status).to eq 200
      expect(response.content_type).to include 'application/json'
      json_response = JSON.parse(response.body)
      expect(json_response.class).to eq Array
      expect(json_response[0]['name']).to include('Teste')
    end
  end

  context 'get api/v1/doctor/:doctor_id/exams' do
    it 'returns doctors exams' do
      doctor = Doctor.create(name: 'Teste', email: 'teste@email.com', crm: '123456', crm_state: 'PR')
      patient = Patient.create(name: 'João', email: 'email@email.com', registration_number: '1342',
                               birth_date: '22/02/2020', address: 'Rua São Sebastião, 181', city: 'Ctba', state: 'PR')
      Exam.create(doctor:, patient:, token: 'ABC123',
                  exam_type: 'Hemácias', type_limits: '41-54', type_result: '50')
      Exam.create(doctor:, patient:, token: 'ABC123',
                  exam_type: 'Urina', type_limits: '45-100', type_result: '45')

      get api_v1_doctor_exams_path(doctor.id)

      expect(response.status).to eq 200
      expect(response.content_type).to include 'application/json'
      json_response = JSON.parse(response.body)
      expect(json_response.class).to eq Array
      expect(json_response[0]['token']).to include('ABC123')
    end
  end
end
