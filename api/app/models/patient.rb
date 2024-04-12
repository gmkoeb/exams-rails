class Patient < ApplicationRecord
  has_many :exams, dependent: :destroy

  validates :registration_number, :email, uniqueness: true
end
