class ChangeJobStatusStatusTypeToInteger < ActiveRecord::Migration[7.1]
  def change
    change_column :job_statuses, :status, :integer, default: 0, using: 'status::integer'
  end
end
