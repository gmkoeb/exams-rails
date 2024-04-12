require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe '#valid' do
    context 'uniqueness' do
      it 'email must be unique' do
        Doctor.create(name: 'Test', email: 'doctor@email.com', crm: 'ABC123', crm_state: 'PR')
        doctor = Doctor.create(name: 'Test', email: 'doctor@email.com', crm: 'ABC1234', crm_state: 'PR')

        expect(doctor.valid?).to eq false
        expect(doctor.errors.full_messages).to include('Email has already been taken')
      end
    end
  end
end
