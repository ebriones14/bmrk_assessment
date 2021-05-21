module Paraday
    class Post < Base

        attr_accessor :user_id,
                      :id,
                      :title,
                      :body

        def self.all
            path                = '/posts'
            response, status    = Request.get(path)
            posts               = response.map{ |r| Post.new(r) }
            
            [posts, status]
        end

    end
end
