lib = File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name        = "authentication"
  s.authors     = ["Shaikhraznova"]
  s.email       = ["Shaikhraznova@netzlaboranten.de"]
  s.version     = '0.2.0'
  s.summary     = "Authentication"
  s.description = "multiple database's session authentication allows to impersonation of users"
  s.require_paths = ["lib"]

  s.add_dependency  'secure_random_string'
end
