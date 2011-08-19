# Load the rails application
require File.expand_path('../application', __FILE__)

require 'will_paginate'

#Rails::Initializer.run do |config|
#  config.gem 'will_paginate', :version => '~> 3.0.pre4'
#end

# Initialize the rails application
VotaPrato::Application.initialize!
