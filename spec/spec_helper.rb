$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'mpk_krakow_rb'
require 'vcr'

# Configuration data
NUMBER_OF_STOPS = 1375
NUMBER_OF_LINES = 184

# VCR configuration
VCR.configure do |config|
  config.cassette_library_dir = 'spec/vcr_cassettes'
  config.hook_into :webmock
end

# RSpec configuration
RSpec.configure do |config|
  # Add VCR to all tests
  config.around(:each) do |example|
    options = example.metadata[:vcr] || {}
    if options[:record] == :skip
      VCR.turned_off(&example)
    else
      name = example.metadata[:full_description]
             .split(/\s+/, 2)
             .join('/')
             .gsub(/\./, '/')
             .gsub(%r{[^\w\/]+}, '_')
             .gsub(%r{/$}, '')
      VCR.use_cassette(name, options, &example)
    end
  end
end
