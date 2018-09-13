class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :education
      t.string :address
      t.date :birthday
      t.string :school_id
      t.integer :cohort_id
      t.integer :course_id
      t.timestamps
    end
    add_index :students, :school_id, unique: true
  end
end
