require './lib/main'

# You should not use this token in your own projects.
# See the README for instructions on getting your own token from TBA.
tba = TBA.new('AykWePEZPKTjZxW6y7MbiTEpTfUlWrszcX5QBpIDUEZPBCJydltvhfd88MsBXxdS')

team = tba.team(254)
districts = tba.team_districts(1418, 2016)

puts "Team 254 is from #{team['city']}."
puts "Team 1418 was in the #{districts[0]['name']} district last year."
