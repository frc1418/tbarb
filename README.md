# tba.rb

[![Gem Version](https://badge.fury.io/rb/tba.svg)](https://badge.fury.io/rb/tba)

Unofficial Ruby API to get data from The Blue Alliance.

This API returns JSON-parsed data fetched from The Blue Alliance's API.

## Installation

Add `tba.rb` to your Gemfile.
```ruby
gem 'tba'
```

Or manualy install
```bash
gem install tba
```

## Setup
To use these functions, you must require the `tba` gem:

    require 'tba'

Before using the API, you must instantiate the class, providing your application's ID in the format `author:application:version`, for example:

    tba = TBA.new('frc254:cheesy_arena:v2.2')

or

    tba = TBA.new('woodie_flowers:scouting-system:5')

The Blue Alliance's API requires that all applications identify themselves when retrieving data.


## Retrieval Functions
These functions should all be preceded by `tba.` (replace with your instance's name if you changed it above).
* `get_teams(page)` - Get a list of of valid teams, where `page * 500` is the starting team number.
* `get_team(team)` - Get a team's data.
* `get_team_events(team, year)` - Get a list of events a team has been to.
* `get_team_awards(team, [event])` - Get a list of the team's awards. _OPTIONAL: Specify an event that you want awards from. Otherwise all a team's awards will be returned._
* `get_team_matches(team, event)` - Get a list of a team's matches at an event.
* `get_team_years(team)` - Get a list of years the team was active in FRC.
* `get_team_media(team, [year])` - Get team media. _OPTIONAL: Specify a year to get media from. Otherwise the current year will be inferred._
* `get_team_history_events(team)` - Get events that a team has been to.
* `get_team_history_awards(team)` - Get all awards that a team has received.
* `get_team_history_robots(team)` - Get all of a team's robots.
* `get_team_history_districts(team)` - Get the districts that a team has been part of over the years.
* `get_event_list([year])` - Get a list of all events. _OPTIONAL: Include a year to get events from that year. Otherwise the current year's events will be returned._
* `get_event(event)` - Get data about an event.
* `get_event_stats(event)` - Get statistics from an event.
* `get_event_rankings(event)` - Get the rankings at an event.
* `get_event_awards(event)` - Get the awards from an event.
* `get_event_matches(event)` - Get a match list of an event.
* `get_district_points(event)` - Get points from a district.
* `get_match(match)` - Get data about a match.
* `get_districts(year)` - Get a list of all districts that exist(ed) in a given year.
* `get_district_events(district, year)` - Get list of events in a district.
* `get_district_rankings(district, year)` - Get the rankings in a district.
* `get_district_teams(district, year)` - Get a list of the teams in a district.

See `example.rb` for a usage example.

Documentation for The Blue Alliance's API can be found [here](https://www.thebluealliance.com/apidocs).

## Authors
This software was created and is maintained by [Erik Boesen](https://github.com/ErikBoesen) with [Team 1418](https://github.com/frc1418).

## License
This software is protected under the [MIT License](LICENSE).
