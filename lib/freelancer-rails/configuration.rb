module Freelancer
  module Rails
    class Configuration

      class << self

        def api_token
          configuration["api_token"]
        end

        def api_secret
          configuration["api_secret"]
        end

        def sandbox_mode?
          configuration["sandbox_mode"] == true
        end

        private
        
        def configuration_file
          "#{RAILS_ROOT}/config/freelancer.yml"          
        end

        # Load the system configuration. This will try to load from the configuration
        # file located in config/freelancer.yml first and use the configuration for the
        # current environment. If that file can't be found, it will use the environment
        # variables "FREELANCER_API_TOKEN", "FREELANCER_API_SECRET" and "FREELANCER_SANDBOX_MODE"
        # instead.
        def load!

          if File.exists?(configuration_file)
            @configuration = YAML.load(ERB.new(File.read(configuration_file)).result)[RAILS_ENV]
          else
            @configuration = {
              "api_token" => ENV["FREELANCER_API_TOKEN"],
              "api_secret" => ENV["FREELANCER_API_SECRET"],
              "sandbox_mode" => ENV["FREELANCER_SANDBOX_MODE"]
            }
          end
          
        end

        def configuration
          load! unless defined?(@configuration)
          @configuration
        end

      end

    end
  end
end
