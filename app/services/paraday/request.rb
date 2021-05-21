module Paraday
    class Request
        class << self

            def get(path)
                response = api.get do |req|
                    req.url path
                    req.headers['Content-Type'] = 'application/json'
                end
                
                [response.body.present? ? JSON.parse(response.body) : { errors: "" }, response.status]
            end

            def post(path)
                # post data
            end

            def patch(path)
                # patch data
            end

            def where(path, params = {})
               # search data
            end

            def api
                Paraday::Connection.api
            end

        end
    end
end
