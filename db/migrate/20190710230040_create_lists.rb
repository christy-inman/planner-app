class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :title
      t.references :task, foreign_key: true
      t.time :start_time
      t.time :end_time
      t.date :start_date
      t.date :end_date
      t.timestamps
    end
  end
end
