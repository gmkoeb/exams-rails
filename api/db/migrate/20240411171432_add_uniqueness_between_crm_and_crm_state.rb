class AddUniquenessBetweenCrmAndCrmState < ActiveRecord::Migration[7.1]
  def change
    add_index :doctors, [:crm, :crm_state], unique: true
  end
end
