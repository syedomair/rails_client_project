module SampleApi
  class User < Base

    #http://localhost:3001/api/users/users/5
    def getUser(user_id)
      response = public_query({
        :endpoint => '/api/users/users/'+user_id.to_s,
        :method => :GET
      })
      response
    end
    #
    #http://localhost:3001/api/users/users/5
    def updateUser(user_id, first_name, last_name)
      response = public_query({
        :endpoint => '/api/users/users/'+user_id.to_s,
        :method => :PATCH,
        :params => {'user' => {'first_name' => "#{first_name}", 'last_name'=>"#{last_name}"}}
      })
      response
    end
  end
end
