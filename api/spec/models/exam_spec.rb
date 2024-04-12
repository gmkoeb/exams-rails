require 'rails_helper'

RSpec.describe Exam, type: :model do
  describe '#valid' do
    context 'uniqueness' do
      it 'exam type must be unique for each token' do
        doctor = Doctor.create(name: 'Test Doctor', email: 'doctor@test.com',
                               crm: '123465', crm_state: 'PR')
        patient = Patient.create(name: 'Test Patient', email: 'patient@email.com',
                                 registration_number: '123456', birth_date: '01/02/2004',
                                 address: 'Rua Sapopema, 153', city: 'Curitiba', state: 'Paraná')
        Exam.create(doctor:, patient:, token: 'ABC123',
                    date: Time.zone.today, exam_type: 'Blood', type_limits: '410-590',
                    type_result: '450')
        exam = Exam.new(doctor:, patient:, token: 'ABC123',
                        date: Time.zone.today, exam_type: 'Blood', type_limits: '410-590',
                        type_result: '450')

        expect(exam.valid?).to eq false
        expect(exam.errors.full_messages).to include 'Exam type has already been taken'
      end
    end
  end
end
