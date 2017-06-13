class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :name
      t.text :description
      t.integer :weight
      t.date :target_date
      t.date :due_date
      t.integer :effort

      t.timestamps
    end
  end
end
