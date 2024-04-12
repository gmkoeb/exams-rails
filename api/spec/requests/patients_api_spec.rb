require 'rails_helper'

describe 'Patients API' do
  context 'get api/v1/patients' do
    it 'returns the patients list with status 200' do
      Patient.create(name: 'João', email: 'email@email.com', registration_number: '1342',
                     birth_date: '22/02/2020', address: 'Rua São Sebastião, 181', city: 'Ctba', state: 'PR')
      
      get api_v1_patients_path

      expect(response.status).to eq 200
      expect(response.content_type).to include 'application/json'
      json_response = JSON.parse(response.body)
      expect(json_response.class).to eq Array
      expect(json_response[0]['name']).to include('João')
    end

    context 'get api/v1/patient/:patient_id/exams' do
      it 'returns doctors exams' do
        doctor = Doctor.create(name: 'Teste', email: 'teste@email.com', crm: '123456', crm_state: 'PR')
        patient = Patient.create(name: 'João', email: 'email@email.com', registration_number: '1342',
                                 birth_date: '22/02/2020', address: 'Rua São Sebastião, 181', city: 'Ctba', state: 'PR')
        Exam.create(doctor:, patient:, token: 'ABC123',
                    exam_type: 'Hemácias', type_limits: '41-54', type_result: '50')
        Exam.create(doctor:, patient:, token: 'ABC123',
                    exam_type: 'Urina', type_limits: '45-100', type_result: '45')
  
        get api_v1_patient_exams_path(patient.id)
  
        expect(response.status).to eq 200
        expect(response.content_type).to include 'application/json'
        json_response = JSON.parse(response.body)
        expect(json_response.class).to eq Array
        expect(json_response[0]['token']).to include('ABC123')
      end
    end
  end
end
