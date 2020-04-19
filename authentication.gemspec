lib = File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name        = "authentication"
  s.authors     = ["Shaikhraznova"]
  s.email       = ["Shaikhraznova@netzlaboranten.de"]
  s.version     = '0.2.0'
  s.summary     = "Authentication"
  s.description = "multiple database's session authentication allows to impersonation of users"
  s.bindir = "exe"
  s.executables = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.required_ruby_version = ">= 2.3.0"

  s.add_dependency  'secure_random_string'
  s.add_dependency "webpacker"
end
