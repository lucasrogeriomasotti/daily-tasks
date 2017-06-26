class RenameDailyTasksToTaskLogs < ActiveRecord::Migration[5.1]
  def change
    rename_table :daily_tasks, :task_logs
  end
end
