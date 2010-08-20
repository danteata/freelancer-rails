module Freelancer
  module Rails
    class Routes

      def self.draw(map)

        map.namespace(:freelancer) do |freelancer|
          freelancer.sign_in "sign_in", :controller => "rails/authorizations", :action => "new"
          freelancer.authorize "authorize", :controller => "rails/authorizations", :action => "create"
          freelancer.oauth_callback "oauth_callback", :controller => "rails/authorizations", :action => "oauth_callback"
        end
        
      end

    end
  end
end
