require 'tba'

tba = TBA.new('frc1418:tba_example:v1.0')

team = tba.get_team(254)
districts = tba.get_team_history_districts(1418)

puts "Team 254 is from #{team['location']}."
puts "Team 1418 was in the #{districts.first[1]} district last year."