require File.expand_path('../lib/authentication/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "authentication"
  s.authors     = ["Shaikhraznova"]
  s.email       = ["Shaikhraznova@netzlaboranten.de"]
  s.homepage      = "https://github.com/angry-boss/authentication"
  s.version     = Authentication::VERSION
  s.files         = Dir.glob("{lib,db}/**/*")
  s.require_path = ["lib"]
  s.summary     = "Authentication"
  s.description = "multiple database's session authentication allows to impersonation of users"
  s.require_paths = ["lib"]

  s.add_dependency  'secure_random_string'
end
