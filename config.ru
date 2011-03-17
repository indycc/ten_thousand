# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
require 'new_relic/rack_app'
use NewRelic::Rack::DeveloperMode
run TenThousand::Application
