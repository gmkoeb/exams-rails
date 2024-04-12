class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :email
      t.string :registration_number
      t.string :birth_date
      t.string :address
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
