class Student < ApplicationRecord
  belongs_to :cohort
  scope :newest_first, -> { order('created_at DESC') }
  validates :first_name, :last_name, :education, :birthday, presence: true

  def full_name
    first_name + ' ' + last_name
  end

  def generate_school_id
    self.school_id = SecureRandom.hex(4).upcase
  end
end
