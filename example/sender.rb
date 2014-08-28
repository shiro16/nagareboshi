lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'nagareboshi'

Nagareboshi.configure do |config|
  config.send = true
  # config.send = Rails.env.production? rails case setting
end

Nagareboshi::Sender.publish("http://...")
Nagareboshi::Sender.publish(["http://...", "http://..."])

# debug
Nagareboshi.configure do |config| 
  config.host    = "localhost"
  config.send    = true
  config.use_ssl = false
end

Nagareboshi::Sender.publish("http://...")
