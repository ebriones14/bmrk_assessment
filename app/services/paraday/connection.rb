module Paraday
    require 'faraday'
    require 'json'

    class Connection
        # Sample fake json rest api
        BASE = 'https://jsonplaceholder.typicode.com'

        def self.api
            conn = Faraday.new(url: BASE) do |faraday|
                faraday.response :logger
                faraday.adapter Faraday.default_adapter
                faraday.headers['Content-Type'] = 'application/json'
            end
        end
    end

end
