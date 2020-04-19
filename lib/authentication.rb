require "authentication/version"
require "authentication/config"
require "authentication/error"
require "authentication/user"

if defined?(Rails)
  require 'authentication/engine'
end
