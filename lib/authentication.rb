require 'authentication/config'
require 'authentication/error'
require 'authentication/user'
require 'authentication/version'

if defined?(Rails)
  require 'authentication/engine'
end
