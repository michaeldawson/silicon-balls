team_members = [
  { name: 'Michael Dawson', expertise: 'Software', linkedin: 'https://www.linkedin.com/in/michael-dawson-36453224/' },
  { name: 'Harry Schiff', expertise: 'Media', linkedin: 'https://www.linkedin.com/in/hschiff' },
  { name: 'Tim Collin', expertise: 'Brewing', linkedin: 'https://www.linkedin.com/in/tim-collin-95721b11b/' },
  { name: 'Raffaele Calabrese', expertise: 'Patent Law, ICT and Electronics', linkedin: 'https://www.linkedin.com/in/raffaele-calabrese-a0097613' },
  { name: 'Steve Auch-Schwelk', expertise: 'Defence Technology and R&D', linkedin: 'https://www.linkedin.com/in/steve-auch-schwelk-3555b72' },
  { name: 'William Chau', expertise: 'Commercial and Taxation Law', linkedin: 'https://www.linkedin.com/in/williamchaulawyer/' },
]

team_members.each do |attributes|
  TeamMember.find_or_initialize_by(name: attributes[:name]).update!(attributes)
end
