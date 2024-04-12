class Doctor < ApplicationRecord
  has_many :exams, dependent: :destroy

  validates :email, uniqueness: true

  validates :crm, uniqueness: { scope: :crm_state }
end
