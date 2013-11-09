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

