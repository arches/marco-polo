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
  wait_proc = proc {
    current_app = ENV["MARCO_POLO_APP_NAME"] || Rails.application.class.module_parent_name.underscore.gsub("_", "-")
    rails_env = Rails.env.downcase

    # shorten some common long environment names
    rails_env = "dev" if rails_env == "development"
    rails_env = "prod" if rails_env == "production"

    "#{current_app}(#{rails_env})> "
  }
  incomplete_proc = proc { "> "}

  if defined? Pry::Prompt
    Pry.config.prompt = Pry::Prompt.new(
      'marco-polo',
      'A prompt which shows your app name and environment',
      [wait_proc, incomplete_proc]
    )
  else
    Pry.config.prompt = [wait_proc, incomplete_proc]
  end
end
