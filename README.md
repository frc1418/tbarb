# tbarb [![Gem Version](https://badge.fury.io/rb/tbarb.svg)](https://badge.fury.io/rb/tbarb)
_1418 TBA Libraries_ // [Python](https://github.com/frc1418/tbapy) // [Go](https://github.com/frc1418/tbago) // [**Ruby**](https://github.com/frc1418/tbarb)

> Ruby library for interfacing with [The Blue Alliance](https://thebluealliance.com) [API](https://thebluealliance.com/apidocs) (v3).

## NOTE: `tba` vs `tbarb`, v3, and breaking changes
On January 1st, 2018, v2 of The Blue Alliance's API was folded in favor of the new v3. The API supports numerous new and helpful features, however it uses endpoints which are incompatible with libraries designed for v2.

A related note on naming: Prior to the v3 update, this package was known as `tba.rb` on git and `tba` in RubyGems. As part of the rewrite required for the new API, the name of this package was changed to `tbarb`, both on git and RubyGems. The old package is still available through RubyGems as `tba`, however using it is not recommended as the package is not functional after 2017.

For potentially breaking function name changes, see [tbapy's README](https://github.com/frc1418/tbapy#breaking-changes-between-v0x-and-v1x).

## Installation

Add `tbarb` to your Gemfile.
```ruby
gem 'tbarb'
```
and then run
```bash
bundle install
```
in the same directory as the Gemfile.

Or install directly from RubyGems:
```bash
gem install tbarb
```

## Setup
To use these functions, you must require the `tba` gem:

```ruby
require 'tbarb'
```

Before using the API, you must instantiate the class, providing a valid TBA auth key. You can obtain one [here](https://www.thebluealliance.com/account).

```ruby
tba = TBA.new('key')
```

## Retrieval Functions
You may specify `simple` as `true` to get only vital data on some models or lists of models, or you may specify `keys` as `true` to get a list of the keys for a list rather than full data on each model. It is recommended to use these options if you do not need full data.

Some requests support `year` and other optional parameters, which are recommended to use to narrow down your results.
* `tba.status()` - Get TBA's status.
* `tba.teams(page, [year], [simple/keys])` - Get a list of of valid teams, where `page * 500` is the starting team number.
* `tba.team(team, [simple])` - Get a team's data. `team` can be an integer team number of a string-form `'frc####'` identifier.
* `tba.team_events(team, [year], [simple/keys])` - Get a list of events a team has been to.
* `tba.team_awards(team, [event/year])` - Get a list of the team's awards.
* `tba.team_matches(team, [event/year], [simple/keys])` - Get a list of a team's matches at an event.
* `tba.team_years(team)` - Get a list of years the team was active in FRC.
* `tba.team_media(team, [year], [tag])` - Get team media. Specify a year to get media from or a tag or both.
* `tba.team_robots(team)` - Get data about a team's robots.
* `tba.team_districts(team)` - Get the districts that a team has been part of over the years.
* `tba.team_profiles(team)` - Get data on a team's media profiles.
* `tba.team_status(team, event)` - Get a team's status at an event.
* `tba.events([year], [simple/keys])` - Get a list of all events.
* `tba.event(event, [simple])` - Get data about an event.
* `tba.event_rankings(event)` - Gets a list of team rankings at a given event.
* `tba.event_alliances(event)` - Get sophisticated data on alliances at a given event.
* `tba.event_district_points(event)` - Get sophisticated data on district points at a given event.
* `tba.event_insights(event)` - Get insight data on a given event.
* `tba.event_oprs(event)` - Get sophisticated data on alliances at a given event.
* `tba.event_predictions(event)` - Get predicted scores for a given event.
* `tba.event_teams(event, [simple/keys])` - Get a list of teams at an event.
* `tba.event_awards(event)` - Get the awards from an event.
* `tba.event_matches(event, [simple/keys])` - Get a match list of an event.
* `tba.match([key], [year], [event], [type], [number], [round], [simple])` - Get data about a match. You may either pass the match's `key` directly, or pass `year`, `event`, `type`, `match` (the match number), and `round` if applicable (playoffs only). The event year may be specified as part of the event key or specified in the `year` parameter.
* `tba.districts(year)` - Get a list of all districts that exist(ed) in a given year.
* `tba.district_events(district, [simple/keys])` - Get list of events in a district.
* `tba.district_rankings(district)` - Get the rankings in a district.
* `tba.district_teams(district, [simple/keys])` - Get a list of the teams in a district.

See `example.rb` for several usage examples.

Documentation for The Blue Alliance's API can be found [here](https://www.thebluealliance.com/apidocs).

## Authors
This software was created and is maintained by [Erik Boesen](https://github.com/ErikBoesen) with [Team 1418](https://github.com/frc1418).

## License
This software is protected under the [MIT License](LICENSE).
