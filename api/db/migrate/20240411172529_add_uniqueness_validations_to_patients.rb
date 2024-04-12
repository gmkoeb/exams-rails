class AddUniquenessValidationsToPatients < ActiveRecord::Migration[7.1]
  def change
    add_index :patients, :email, unique: true
    add_index :patients, :registration_number, unique: true
  end
end
