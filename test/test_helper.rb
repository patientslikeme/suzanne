require "bundler"
Bundler.setup

require "suzanne"
require "minitest/autorun"

Bundler.require(:test)

Dir[File.expand_path("../support/*.rb", __FILE__)].each { |f| require f }

$original_env_keys = ENV.keys

class Minitest::Test

  def setup
    # Restore the original state of ENV for each test
    ENV.keep_if { |k, _| $original_env_keys.include?(k) }
  end

  def load_config
    Suzanne.configure File.expand_path("test.yml", __dir__)
  end

  def load_config_erb
    Suzanne.configure File.expand_path("test.yml.erb", __dir__)
  end

end
