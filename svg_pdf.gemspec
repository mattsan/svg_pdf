# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'svg_pdf/version'

Gem::Specification.new do |spec|
  spec.name = 'svg_pdf'
  spec.version = SvgPdf::VERSION
  spec.authors = ['Eiji MATSUMOTO']
  spec.email = ['e.mattsan@gmail.com']

  spec.summary = 'Render PDF from SVG.'
  spec.description = 'Render PDF from SVG.'
  spec.homepage = 'https://github.com/mattsan/svg_pdf'
  spec.license = 'MIT'

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://github.com/mattsan'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) {|f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'haml', '~> 5.1'
  spec.add_dependency 'rake', '~> 13.0'
  spec.add_dependency 'rsvg2', '~> 3.4'
  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.9'
  spec.add_development_dependency 'deka_eiwakun', '~> 0.53'
end
