class CreateInstructors < ActiveRecord::Migration[5.2]
  def change
    create_table :instructors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :salary
      t.date :birthday
      t.string :education
      t.string :school_id
      t.string :password_digest, limit: 32
      t.boolean :admin, default: false
      t.timestamps
    end
    add_index :instructors, :email, unique: true
    add_index :instructors, :school_id, unique: true
  end
end
