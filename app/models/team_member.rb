class TeamMember < ApplicationRecord
  validates :name, presence: true
  validates :expertise, presence: true
end
