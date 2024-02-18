if ENV['RAILS_ENV']
  rails_env = ENV['RAILS_ENV'].downcase
elsif Rails and Rails.env
  rails_env = Rails.env.downcase
end

if rails_env
  current_app = ENV["MARCO_POLO_APP_NAME"] || Rails.application.class.module_parent_name.underscore.gsub("_", "-")

  # shorten some common long environment names
  rails_env = "dev" if rails_env == "development"
  rails_env = "prod" if rails_env == "production"

  IRB.conf[:PROMPT][:RAILS_ENV] = {
    :PROMPT_I => "#{current_app}(#{rails_env})> ",
    :PROMPT_N => "#{current_app}(#{rails_env})> ",
    :PROMPT_S => nil,
    :PROMPT_C => "#{current_app}(#{rails_env})> ",
    :RETURN => "=> %s\n"
  }

  IRB.conf[:PROMPT_MODE] = :RAILS_ENV
end
