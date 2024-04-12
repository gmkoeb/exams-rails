class Exam < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  validates :exam_type, uniqueness: { scope: :token }
end
