require File.expand_path('../lib/formatize/version', __FILE__)

Gem::Specification.new do |s|
  s.name    = 'formatize'
  s.version = Formatize::VERSION

  s.author = 'David Trasbo'
  s.email  = 'me@dtrasbo.com'

  s.homepage = 'http://github.com/dtrasbo/formatize'
  s.summary  = 'Gem containing the textilize, textilize_without_paragraph, and markdown helper methods removed from Rails.'

  s.files = Dir['lib/**/*', 'LICENSE', 'README.md']

  s.add_dependency 'RedCloth',   '~> 4.2'
  s.add_dependency 'bluecloth',  '~> 2.0'
  s.add_dependency 'actionpack', '3.0.0'
end