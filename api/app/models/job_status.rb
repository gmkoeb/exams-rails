class JobStatus < ApplicationRecord
  enum status: { pending: 0, done: 10 }

  before_create :generate_token

  private

  def generate_token
    self.token = SecureRandom.alphanumeric(8).upcase
  end
end
