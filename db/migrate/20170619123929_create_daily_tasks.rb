class CreateDailyTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :daily_tasks do |t|
      t.string :name
      t.integer :duration
      t.date :date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
