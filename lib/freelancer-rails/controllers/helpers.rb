module Freelancer
  module Rails
    module Controllers
      module Helpers

        # Returns the current instance of the Freelancer Client
        def freelancer_client
          @freelancer_client ||= Freelancer::Client.new(Freelancer::Rails::Configuration.api_token, Freelancer::Rails::Configuration.api_secret, :sandbox => Freelancer::Rails::Configuration.sandbox_mode?)
        end
        
        # Returns true if the current user session contains an access token
        def freelancer_access_token?
          freelancer_access_token != nil          
        end
        
        # Returns the current access token from the user session
        def freelancer_access_token
          session["freelancer_oauth_access_token"]
        end
        
        # Returns true if the current user session contains an access secret
        def freelancer_access_secret?
          freelancer_access_secret != nil
        end
        
        # Returns the current access secret from the user session
        def freelancer_access_secret
          session["freelancer_oauth_access_secret"]
        end
        
      end
    end
  end
end
