class AddTaskToTaskLogs < ActiveRecord::Migration[5.1]
  def change
    add_reference :task_logs, :task, foreign_key: true
  end
end
