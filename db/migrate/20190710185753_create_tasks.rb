class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.time :start_time
      t.time :end_time
      t.date :start_date
      t.date :end_date
      t.references :list, foregin_key: true
    end
  end
end
