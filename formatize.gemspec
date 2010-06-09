require File.expand_path('../lib/formatize/version', __FILE__)

Gem::Specification.new do |s|
  s.name    = 'formatize'
  s.version = Formatize::VERSION

  s.author = 'David Heinemeier Hansson'
  s.email  = 'david@loudthinking.com'

  s.homepage = 'http://github.com/dtrasbo/formatize'
  s.summary  = 'Plugin containing the textilize, textilize_without_paragraph, and markdown helpers removed from Rails.'

  s.files = Dir['lib/**/*', 'LICENSE', 'README.md']

  s.add_dependency 'RedCloth', '~> 4.2'
  s.add_dependency 'bluecloth', '~> 2.0'
  s.add_development_dependency 'actionpack'
end