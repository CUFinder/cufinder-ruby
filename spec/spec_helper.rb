require "bundler/setup"
require "cufinder_ruby"
require "webmock/rspec"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `main` and `Module`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  
  # Configure WebMock
  WebMock.disable_net_connect!(allow_localhost: true)
end
