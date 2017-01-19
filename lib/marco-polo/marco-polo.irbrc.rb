if ENV['RAILS_ENV']
  rails_env = ENV['RAILS_ENV'].downcase
elsif Rails and Rails.env
  rails_env = Rails.env.downcase
end

if rails_env
  current_app = ENV["MARCO_POLO_APP_NAME"] || Rails.application.class.parent_name.underscore.gsub("_", "-")

  # shorten some common long environment names and set color
  red = "\033[0;31m"
  green = "\033[0;32m"
  reset = "\033[0m"

  if rails_env == "development"
    rails_env = "dev"
    color = green
  end
  if rails_env == "production"
    rails_env = "prod"
    color = red
  end
  
  IRB.conf[:PROMPT][:RAILS_ENV] = {
      :PROMPT_I => "#{current_app}#{color}[#{rails_env}]#{reset}> ",
      :PROMPT_N => "#{current_app}#{color}[#{rails_env}]#{reset}> ",
      :PROMPT_S => nil,
      :PROMPT_C => "?> ",
      :RETURN => "=> %s\n"
  }

  IRB.conf[:PROMPT_MODE] = :RAILS_ENV

end
