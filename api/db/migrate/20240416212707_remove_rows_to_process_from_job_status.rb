class RemoveRowsToProcessFromJobStatus < ActiveRecord::Migration[7.1]
  def change
    remove_column :job_statuses, :rows_to_process
  end
end
