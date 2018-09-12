# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

def generate_school_id
  school_id = SecureRandom.hex(4).upcase
end

instructor = Instructor.create(
  first_name: 'Stephanie',
  last_name: 'Vital-Herne',
  email: 'vitalherne@gmail.com',
  salary: '$100,000-$110,000',
  birthday: '1991-02-27',
  education: 'PhD',
  school_id: generate_school_id,
  password: '12345678',
  admin: true
)

# Instructor.last.destroy
