class CreateDoctors < ActiveRecord::Migration[7.1]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :email
      t.string :crm
      t.string :crm_state

      t.timestamps
    end
  end
end
