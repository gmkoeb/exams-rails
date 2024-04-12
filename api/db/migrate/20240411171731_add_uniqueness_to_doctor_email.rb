class AddUniquenessToDoctorEmail < ActiveRecord::Migration[7.1]
  def change
    add_index :doctors, :email, unique: true
  end
end
