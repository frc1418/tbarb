require 'net/http'
require 'uri'
require 'json'

class TBA

    @@API_ROOT = 'https://www.thebluealliance.com/api/v2/'
    @api_key = ''

    def initialize(key)
        @api_key = key
    end

    def get(path)
        uri = URI(@@API_ROOT + path)

        Net::HTTP.start(uri.host, uri.port,
            :use_ssl => uri.scheme == 'https') do |http|
            request = Net::HTTP::Get.new(uri)
            request.add_field("X-TBA-App-Id", @api_key)

            response = http.request request # Net::HTTPResponse object
            return JSON.parse(response.body)
        end
    end

    def get_teams(index)
        get("teams/#{index}")
    end

    def get_team(team)
        get("team/frc#{team}")
    end

    def get_team_events(team, year)
        get("team/frc#{team}/#{year}/events")
    end

    def get_team_awards(team, *event)
        if event[0]
            get("team/frc#{team}/event/#{event[0]}/awards")
        else
            get("team/frc#{team}/awards")
        end
    end

    def get_team_matches(team, event)
        get("team/frc#{team}/event/#{event}/matches")
    end

    def get_team_years(team)
        get("team/frc#{team}/years_participated")
    end

    def get_team_media(team, *year)
        if year[0]
            get("team/frc#{team}/#{year[0]}/media")
        else
            get("team/frc#{team}/media")
        end
    end

    def get_team_history_events(team)
        get("team/frc#{team}/history/events")
    end

    def get_team_history_awards(team)
        get("team/frc#{team}/history/awards")
    end

    def get_team_history_robots(team)
        get("team/frc#{team}/history/robots")
    end

    def get_team_history_districts(team)
        get("team/frc#{team}/history/districts")
    end

    def get_event_list(*year)
        if year[0]
            get("events/#{year}")
        else
            get("events/")
        end
    end

    def get_event(event)
        get("event/#{event}")
    end

    def get_event_teams(event)
        get("event/#{event}/teams")
    end

    def get_event_stats(event)
        get("event/#{event}/stats")
    end

    def get_event_rankings(event)
        get("event/#{event}/rankings")
    end

    def get_event_awards(event)
        get("event/#{event}/awards")
    end

    def get_event_matches(event)
        get("event/#{event}/matches")
    end

    def get_district_points(event)
        get("event/#{event}/district_points")
    end

    # TODO: Make this a bit more accessible. Add automatic key generation, etc.
    def get_match(match)
        get("match/#{match}")
    end

    def get_districts(year)
        get("districts/#{year}")
    end

    def get_district_events(district, year)
        get("district/#{district}/#{year}/events")
    end

    def get_district_rankings(district, year)
        get("district/#{district}/#{year}/rankings")
    end

    def get_district_teams(district, year)
        get("district/#{district}/#{year}/teams")
    end

end
