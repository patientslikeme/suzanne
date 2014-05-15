require "yaml"
require "suzanne/version"
require "suzanne/env"

module Suzanne
  extend self

  ##
  # Reads the configuration YAML file and updates ENV. Pre-existing environment 
  # variables are not overwritten.
  #
  #   Suzanne.configure("config/application.yml")
  def configure(config_file)
    hash = File.exist?(config_file) ? YAML.load(File.read(config_file)) : {}

    flatten(hash).each do |key, value|
      ENV[key] = value unless ENV.key?(key)
    end
  end

  ##
  # Access configuration settings (and environment variables).
  #
  #   Suzanne.env.log_path  # => '/log'
  #   Suzanne.env.LOG_PATH  # => '/log'
  #   ENV['LOG_PATH']       # => '/log'
  def env
    Suzanne::Env
  end

private

  ##
  # Remove elements whose values are hashes and stringify both keys and values.
  def flatten(hash)
    hash.inject({}) do |h, (k, v)|
      case v
      when Hash then nil
      when NilClass then h[k.to_s] = nil
      else h[k.to_s] = v.to_s
      end

      h
    end
  end
end
