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

def random_number
  rand(1..7)
end

def education
  edu = ['High School', 'College', 'Masters', 'PhD']
  edu.sample
end

# instructor = Instructor.create(
#   first_name: 'Principal',
#   last_name: 'Waltz',
#   email: 'waltz@ps118.com',
#   salary: '$100,000-$110,000',
#   birthday: '1991-02-27',
#   education: 'PhD',
#   school_id: generate_school_id,
#   password: '12345678',
#   admin: true
# )

150.times do
  student = Student.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    education: education,
    address: Faker::Address.full_address,
    birthday: Faker::Date.birthday(min_age = 18, max_age = 150),
    school_id: generate_school_id,
    cohort_id: random_number,
    course_id: random_number
  )
end
# Instructor.last.destroy
