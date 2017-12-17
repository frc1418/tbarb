require "net/http"
require "uri"
require "json"

class TBA

    @@API_ROOT = "https://www.thebluealliance.com/api/v3/"
    @auth_key = ""

    def initialize(key)
        @auth_key = key
    end

    def get(path)
        uri = URI(@@API_ROOT + path)

        Net::HTTP.start(uri.host, uri.port,
            :use_ssl => uri.scheme == "https") do |http|
            req = Net::HTTP::Get.new(uri)
            req.add_field("X-TBA-Auth-Key", @auth_key)

            return JSON.parse(http.request(req).body)
        end
    end

    def team_key(identifier)
        return identifier.is_a?(Integer) ? "frc#{identifier}" : identifier
    end

    def status
        get("status")
    end

    def teams(page, year=nil, simple=false, keys=false)
        if year
            if keys
                get("teams/#{year}/#{page}/keys")
            else
                get("teams/#{year}/#{page}#{simple ? "/simple" : ""}")
            end
        else
            if keys
                get("teams/#{page}/keys")
            else
                get("teams/#{page}#{simple ? "/simple" : ""}")
            end
        end
    end

    def team(team, simple=false)
        get("team/#{team_key(team)}#{simple ? "/simple" : ""}")
    end

    def team_events(team, year=nil, simple=false, keys=false)
        if year
            if keys
                get("team/#{team_key(team)}/events/#{year}/keys")
            else
                get("team/#{team_key(team)}/events/#{year}#{simple ? "/simple" : ""}")
            end
        else
            if keys
                get("team/#{team_key(team)}/events/keys")
            else
                get("team/#{team_key(team)}/events#{simple ? "/simple" : ""}")
            end
        end
    end

    def team_awards(team, year=nil, event=nil)
        if event
            get("team/#{team_key(team)}/event/#{event}/awards")
        else
            if year
                get("team/#{team_key(team)}/awards/#{year}")
            else
                get("team/#{team_key(team)}/awards")
            end
        end
    end

    def team_matches(team, event=nil, year=nil, simple=false, keys=false)
        if event
            if keys
                get("team/#{team_key(team)}/event/#{event}/matches/keys")
            else
                get("team/#{team_key(team)}/event/#{event}/matches#{simple ? "/simple" : ""}")
            end
        elsif year
            if keys
                get("team/#{team_key(team)}/matches/#{year}/keys")
            else
                get("team/#{team_key(team)}/matches/#{year}#{simple ? "/simple" : ""}")
            end
        end
    end

    def team_years(team)
        get("team/#{team_key(team)}/years_participated")
    end

    def team_media(team, year=nil, tag=nil)
        get("team/#{team_key(team)}/media#{tag ? ("/tag/#{tag}") : ""}#{year ? ("/#{year}") : ""}")
    end

    def team_robots(team)
        get("team/#{team_key(team)}/robots")
    end

    def team_districts(team)
        get("team/#{team_key(team)}/districts")
    end

    def team_profiles(team)
        get("team/#{team_key(team)}/social_media")
    end

    def team_status(team, event)
        get("team/#{team_key(team)}/event/#{event}/status")
    end

    def events(year, simple=false, keys=false)
        if keys
            get("events/#{year}/keys")
        else
            get("events/#{year}#{simple ? "/simple" : ""}")
        end
    end

    def event(event, simple=false)
        get("event/#{event}#{simple ? "/simple" : ""}")
    end

    def event_alliances(event)
        get("event/#{event}/alliances")
    end

    def event_district_points(event)
        get("event/#{event}/district_points")
    end

    def event_insights(event)
        get("event/#{event}/insights")
    end

    def event_oprs(event)
        get("event/#{event}/oprs")
    end

    def event_predictions(event)
        get("event/#{event}/predictions")
    end

    def event_rankings(event)
        get("event/#{event}/rankings")
    end

    def event_teams(event, simple=false, keys=false)
        if keys
            get("event/#{event}/teams/keys")
        else
            get("event/#{event}/teams#{simple ? "/simple" : ""}")
        end
    end

    def event_awards(event)
        get("event/#{event}/awards")
    end

    def event_matches(event, simple=false, keys=false)
        if keys
            get("event/#{event}/matches/keys")
        else
            get("event/#{event}/matches#{simple ? "/simple" : ""}")
        end
    end

    def match(key=nil, year=nil, event=nil, type="qm", number=nil, round=nil, simple=false)
        if key
            get("match/#{key}#{simple ? "/simple" : ""}")
        else
            get("match/#{event[0].isDigit() ? "" : year}#{event}_#{type}#{number}#{type == "qm" ? "" : "m#{round}"}#{simple ? "/simple" : ""}")
        end
    end

    def districts(year)
        get("districts/#{year}")
    end

    def district_events(district, simple=false, keys=false)
        if keys
            get("district/#{district}/events/keys")
        else
            get("district/#{district}/events#{simple ? "/simple" : ""}")
        end
    end

    def district_rankings(district)
        get("district/#{district}/rankings")
    end

    def district_teams(district, simple=false, keys=false)
        if keys
            get("district/#{district}/teams/keys")
        else
            get("district/#{district}/teams")
        end
    end
end
