require 'rails_helper'

RSpec.describe JobStatus, type: :model do
  describe '#generate_token' do
    it 'generates a random 8 digit token on JobStatus creation' do
      status = JobStatus.create
      
      expect(status.token.length).to eq 8
    end
  end
end
