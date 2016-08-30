$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name = 'any_strong_parameter'
  s.version = '0.0.1'

  s.required_ruby_version = Gem::Requirement.new('>= 2.0.0')
  s.authors = ['Adam Becker']
  s.summary = 'Gem of https://github.com/rails/strong_parameters/pull/231'
  s.email = 'adam@dobt.co'
  s.license = 'MIT'

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {features,spec}/*`.split("\n")

  s.homepage = 'http://github.com/dobtco/any_strong_parameter'

  s.add_dependency 'rails', '>= 4.0.0'

  s.add_development_dependency 'appraisal'
  s.add_development_dependency 'combustion'
  s.add_development_dependency 'rspec-rails'
end
