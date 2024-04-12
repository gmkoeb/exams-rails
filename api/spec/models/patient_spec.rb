require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe '#valid' do
    context 'uniqueness' do
      it 'email must be unique' do
        Patient.create(name: 'João', email: 'email@email.com', registration_number: '1342',
                       birth_date: '22/02/2020', address: 'Rua São Sebastião, 181', city: 'Ctba', state: 'PR')
        patient = Patient.create(name: 'André', email: 'email@email.com', registration_number: '13425',
                                 birth_date: '22/02/2020', address: 'Rua São Sebastião, 181', city: 'Ctba', state: 'PR')

        expect(patient.valid?).to eq false
        expect(patient.errors.full_messages).to include 'Email has already been taken'
      end

      it 'registration number must be unique' do
        Patient.create(name: 'João', email: 'email@email.com', registration_number: '1342',
                       birth_date: '22/02/2020', address: 'Rua São Sebastião, 181', city: 'Ctba', state: 'PR')
        patient = Patient.create(name: 'André', email: 'email2@email.com', registration_number: '1342',
                                 birth_date: '22/02/2020', address: 'Rua São Sebastião, 181', city: 'Ctba', state: 'PR')

        expect(patient.valid?).to eq false
        expect(patient.errors.full_messages).to include 'Registration number has already been taken'
      end
    end
  end
end
