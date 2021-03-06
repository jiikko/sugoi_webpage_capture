# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sugoi_webpage_capture/version'

Gem::Specification.new do |spec|
  spec.name          = "sugoi_webpage_capture"
  spec.version       = SugoiWebpageCapture::VERSION
  spec.authors       = ["jiikko"]
  spec.email         = ["n905i.1214@gmail.com"]
  spec.description   = %q{Webpage capture.}
  spec.summary       = %q{Webpage capture, using selenium.}
  spec.homepage      = "https://github.com/jiikko/sugoi_webpage_capture"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"

  spec.add_dependency 'capybara'
  spec.add_dependency 'selenium-webdriver'
  spec.add_dependency 'chromedriver-helper'
end
