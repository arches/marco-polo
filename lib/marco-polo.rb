module MarcoPolo
  class Railtie < Rails::Railtie
    console do
      ARGV.push "-r", File.join(File.dirname(__FILE__),
                                "marco-polo",
                                "marco-polo.irbrc.rb")

      app_specific = File.join(Rails.root, ".irbrc.rb")
      ARGV.push "-r", app_specific if File.exist? app_specific
    end
  end
end

if defined? Pry
  Pry.config.prompt = Pry::Prompt.new(
    "marco polo",
    "marco polo prompt",
    [
      proc {
        current_app = ENV["MARCO_POLO_APP_NAME"] || Rails.application.class.module_parent_name.underscore.gsub("_", "-")
        rails_env = Rails.env.downcase

        # Define colors
        red = "\e[0;31m"
        green = "\e[0;32m"
        reset = "\e[0m"

        # shorten some common long environment names
        if rails_env == "development"
          rails_env = "dev"
          color = green
        end
        if rails_env == "production"
          rails_env = "prod"
          color = red
        end

        "#{current_app}#{color}(#{rails_env})#{reset}> "
      },
      proc { "> "}
    ]
  )
end
