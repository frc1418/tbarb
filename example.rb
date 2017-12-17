require './lib/main'

# You should not use this token in your own projects.
# See the README for instructions on getting your own token from TBA.
tba = TBA.new('AykWePEZPKTjZxW6y7MbiTEpTfUlWrszcX5QBpIDUEZPBCJydltvhfd88MsBXxdS')

team = tba.team(254)
puts "Team 254 is from #{team['city']}."

districts = tba.team_districts(1418)
puts "Team 1418 is in the #{districts[-1]['display_name']} district."
