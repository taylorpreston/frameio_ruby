Gem::Specification.new do |s|
  s.author      = 'Taylor Preston'
  s.date        = '2019-06-19'
  s.description = 'Frameio Ruby is a simple gem that wraps HTTParty and makes it easy to hit the Frameio API.'
  s.email       = 'taylor.preston.dev@gmail.com'
  s.files       = ['lib/frameio.rb']
  s.license     = 'MIT'
  s.name        = 'frameio_ruby'
  s.summary     = 'A small ruby gem to help with your Frameio integration'
  s.version     = '0.1.0'

  s.add_runtime_dependency 'httparty', '~>0.17.0'
  s.add_development_dependency 'rspec', '~>3.8.0'
end  