class CreateJobStatuses < ActiveRecord::Migration[7.1]
  def change
    create_table :job_statuses do |t|
      t.string :token
      t.string :status

      t.timestamps
    end
  end
end
