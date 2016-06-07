module SampleApi
  class Session < Base

    def signin(email, password)
      response = query({
        :endpoint => '/api/users/signin',
        :method => :POST,
        :params => {'user' => {'email' => "#{email}", 'password'=>"#{password}"}}
      })
      puts response.inspect
      response
    end

    def signup(email, password, password_confirmation)
      response = query({
        :endpoint => '/api/public/signup',
        :method => :POST,
        :params => {'user' => {'email' => "#{email}", 'password'=>"#{password}", 'password_confirmation'=>"#{password_confirmation}"}}
      })
      puts response.inspect
      response
    end

  end
end
