class Course < ApplicationRecord
  has_many :cohorts
  has_many :students
end
