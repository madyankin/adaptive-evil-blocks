require 'pathname'

package = Pathname(__FILE__).dirname.join('package.json').read
version = package.match(/"version": "([\d\.]+)",/)[1]

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'adaptive-evil-blocks-rails'
  s.version     = version
  s.summary     = 'Adaptive JS for Evil Blocks'

  s.files            = %w(lib/adaptive-evil-blocks.coffee
                          lib/adaptive-evil-blocks-rails.rb
                          LICENSE
                          README.md
                        )
  s.extra_rdoc_files = %w(LICENSE README.md)
  s.require_path     = 'lib'

  s.author   = 'Alexander Madyankin'
  s.email    = 'alexander@madyankin.name'
  s.homepage = 'https://github.com/outpunk/adaptive-evil-blocks'
  s.license  = 'MIT'

  s.add_dependency 'sprockets',   '>= 2'
  s.add_dependency 'evil-blocks', '>= 0.6'
end
