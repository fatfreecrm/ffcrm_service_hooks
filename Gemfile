source 'https://rubygems.org'

gemspec

gem "fat_free_crm", git: 'https://github.com/fatfreecrm/fat_free_crm.git'
gem 'ffcrm_merge', git: "https://github.com/fatfreecrm/ffcrm_merge.git", branch: "rails4"
gem 'responds_to_parent', git: 'https://github.com/CloCkWeRX/responds_to_parent.git', branch: 'patch-2' # Temporarily pointed at git until https://github.com/zendesk/responds_to_parent/pull/7 is released
gem 'acts_as_commentable', git: 'https://github.com/fatfreecrm/acts_as_commentable.git', branch: "rails-61"

group :development, :test do
  gem "jquery-rails" # jquery-rails is used by the dummy application
  gem "factory_bot_rails"
  gem "byebug" unless ENV["CI"]
end
