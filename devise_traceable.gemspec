# -*- encoding: utf-8 -*-
require File.expand_path("../lib/devise_traceable/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "devise_traceable"
  s.version     = DeviseTraceable::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = []
  s.email       = []
  s.homepage    = "http://rubygems.org/gems/devise_traceable"
  s.summary     = "Simple tracing addon for devise"
  s.description = "Adds table to track signed_in, signed_out, ip "

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "devise_traceable"

  s.add_development_dependency "bundler", ">= 1.0.0"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
