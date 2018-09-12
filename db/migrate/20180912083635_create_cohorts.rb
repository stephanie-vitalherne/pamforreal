class CreateCohorts < ActiveRecord::Migration[5.2]
  def change
    create_table :cohorts do |t|
      t.string :name
      t.text :description
      t.date :start
      t.date :end
      t.integer :course_id
      t.string :instructor
      t.timestamps
    end
  end
end
