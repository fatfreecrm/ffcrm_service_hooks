# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'ffcrm_service_hooks/version'

Gem::Specification.new do |s|
  s.name = 'ffcrm_service_hooks'
  s.authors = ['Ben Tillman']
  s.summary = 'Fat Free CRM - Service hooks'
  s.description = 'Fat Free CRM - Service hooks'
  s.files = `git ls-files`.split("\n")
  s.version = FatFreeCRM::ServiceHooks::VERSION

  s.add_dependency "rails"
  s.add_dependency "fat_free_crm"
  s.add_dependency "ffcrm_merge"
  s.add_dependency "nestful"

  s.add_development_dependency 'pg'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'ffaker'

end
