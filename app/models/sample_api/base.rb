module SampleApi
  class Base

    include HTTParty

    #base_uri "http://localhost:3001"
    def query opts
      api_key = SampleApi::Config.api_key



      method   = opts[:method].to_s.downcase
      access_type = 'secured'
      user_email = opts[:params]['user']['email']
      user_password = opts[:params]['user']['password']
      token = "custom_auth api_key=\"#{api_key}\", access_type=\"#{access_type}\", user_email=\"#{user_email}\", password=\"#{user_password}\""

      response = self.class.send(method, opts[:endpoint], query: opts[:params], headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json', 'so_auth'=>token })

      data = response.parsed_response

      
      if response.success?
        if [ TrueClass, FalseClass, Fixnum ].include?(data.class)
          data
        else
          convert_to_mash(data)
        end
      else
        nil
      end
    end


    private

    def convert_to_mash data
      if data.is_a? Hash
        Hashie::Mash.new(data)
      elsif data.is_a? Array
        data.map { |d| Hashie::Mash.new(d) }
      end
    end

  end
end



#    def login_app
#      response = query({
#        :endpoint => '/cobrand/login',
#        :method => :POST,
#        :params => {
#          :cobrandLogin => Yodlee::Config.cob_username,
#          :cobrandPassword => Yodlee::Config.cob_password
#        }
#      })
#      self.current_session_started = Time.zone.now
#      self.current_session_token = response.session.cobSession
#
#      response = query({
#        :endpoint => '/user/login',
#        :method => :POST,
#        :params => {
#          :loginName => Yodlee::Config.user_name,
#          :password => Yodlee::Config.user_password
#        }
#      })
#      self.user_session = response.user.session.userSession
#
#    end
#     
#    def fresh_token?
#      current_session_token && current_session_started && current_session_started >= 90.minutes.ago
#    end
#
#  end
#end
#
#    # First Test
#    def login_app
#      credentials = {
#        :cobrandLogin => Yodlee::Config.username,
#        :cobrandPassword => Yodlee::Config.password
#      }
#      response = self.class.post('/authenticate/coblogin', query: credentials)
#   end

