class AddProcessedRowsToJobStatus < ActiveRecord::Migration[7.1]
  def change
    add_column :job_statuses, :processed_rows, :integer
  end
end
