team_members = [
  { name: 'Michael Dawson', expertise: 'Software Development' }
]

team_members.each do |attributes|
  TeamMember.create!(attributes)
end
