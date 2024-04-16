class AddRowsToProcessToJobStatus < ActiveRecord::Migration[7.1]
  def change
    add_column :job_statuses, :rows_to_process, :integer
  end
end
