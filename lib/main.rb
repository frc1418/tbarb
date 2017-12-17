require 'net/http'
require 'uri'
require 'json'

class TBA

    @@API_ROOT = 'https://www.thebluealliance.com/api/v3/'
    @auth_key = ''

    def initialize(key)
        @auth_key = key
    end

    def get(path)
        uri = URI(@@API_ROOT + path)

        Net::HTTP.start(uri.host, uri.port,
            :use_ssl => uri.scheme == 'https') do |http|
            req = Net::HTTP::Get.new(uri)
            req.add_field('X-TBA-Auth-Key', @auth_key)

            return JSON.parse(http.request(req).body)
        end
    end

    def team_key(identifier)
        return identifier.is_a?(Integer) ? "frc#{identifier}" : identifier
    end

    def team(number)
        get("team/#{team_key(number)}")
    end

end
