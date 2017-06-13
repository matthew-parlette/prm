class AddJobStatusField < ActiveRecord::Migration[5.1]
  def change
    add_reference :jobs, :status, references: :job_statuses, index: true
    add_foreign_key :jobs, :job_statuses, column: :status_id
  end
end
