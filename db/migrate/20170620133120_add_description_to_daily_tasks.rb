class AddDescriptionToDailyTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :daily_tasks, :description, :text
  end
end
