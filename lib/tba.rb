require 'net/http'
require 'uri'
require 'json'

module TBA

    URL_PRE = 'https://www.thebluealliance.com/api/v2/'
    URL_POST = '?X-TBA-App-Id=erikboesen:tba.rb:v0.1'

    def TBA.fetch(url)
        JSON.parse(Net::HTTP.get(URI.parse(URL_PRE + url + URL_POST)))
    end

    def TBA.get_teams(index)
        fetch('teams/' + index.to_s)
    end

    def TBA.get_team(team)
        fetch('team/frc' + team.to_s)
    end

    def TBA.get_team_events(team, year)
        fetch('team/frc' + team + '/' + year)
    end

    def TBA.get_team_awards(team, *event)
        if event[0]
            fetch('team/frc' + team.to_s + '/event/' + event[0] + '/awards')
        else
            fetch('team/frc' + team.to_s)
        end
    end

    def TBA.get_team_matches(team, event)
        fetch('team/frc' + team + '/event/' + event + '/matches')
    end

    def TBA.get_team_years(team)
        fetch('team/frc' + team + '/years_participated')
    end

    def TBA.get_team_media(team, *year)
        if year[0]
            fetch('team/frc' + team.to_s + '/' + year[0].to_s + '/media')
        else
            fetch('team/frc' + team.to_s + '/media')
        end
    end

    def TBA.get_team_history_events(team)
        fetch('team/frc' + team + '/history/events')
    end

    def TBA.get_team_history_awards(team)
        fetch('team/frc' + team + '/history/awards')
    end

    def TBA.get_team_history_robots(team)
        fetch('team/frc' + team + '/history/robots')
    end

    def TBA.get_team_history_districts(team)
        fetch('team/frc' + team + '/history/districts')
    end

    def TBA.get_event_list(*year)
        if year[0]
            fetch('events/' + year)
        else
            fetch('events/')
        end
    end

    def TBA.get_event(event)
        fetch('event/' + event)
    end

    def TBA.get_event_teams(event)
        fetch('event/' + event + '/teams')
    end

    def TBA.get_event_stats(event)
        fetch('event/' + event + '/stats')
    end

    def TBA.get_event_rankings(event)
        fetch('event/' + event + '/rankings')
    end

    def TBA.get_event_awards(event)
        fetch('event/' + event + '/awards')
    end

    def TBA.get_event_matches(event)
        fetch('event/' + event + '/matches')
    end

    def TBA.get_district_points(event)
        fetch('event/' + event + '/district_points')
    end

    # TODO: Make this a bit more accessible. Add automatic key generation, etc.
    def TBA.get_match(match)
        fetch('match/' + match)
    end

    def TBA.get_districts(year)
        fetch('districts/' + year.to_s)
    end

    def TBA.get_district_events(district, year)
        fetch('district/' + district + '/' + year + '/events')
    end

    def TBA.get_district_rankings(district, year)
        fetch('district/' + district + '/' + year + '/rankings')
    end

    def TBA.get_district_teams(district, year)
        fetch('district/' + district + '/' + year + '/teams')
    end

end