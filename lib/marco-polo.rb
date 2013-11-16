module MarcoPolo
  class Railtie < Rails::Railtie
    initializer "marco_polo.run_irb_config" do |app|
      app.instance_eval do
        def load_console(app=self)
          super
          ARGV.push "-r", File.join(File.dirname(__FILE__),
                                    "marco-polo",
                                    "marco-polo.irbrc.rb")

          app_specific = File.join(Rails.root, ".irbrc.rb")
          ARGV.push "-r", app_specific if File.exist? app_specific
        end
      end
    end
  end
end

if defined? Pry
  Pry.config.prompt = [
    proc {
      current_app = Rails.application.class.parent_name.underscore.gsub("_", "-")
      rails_env = Rails.env.downcase

      # shorten some common long environment names
      rails_env = "dev" if rails_env == "development"
      rails_env = "prod" if rails_env == "production"

      "#{current_app}(#{rails_env})> "
    },
    proc { "> "}
  ]
end

