source 'https://rubygems.org'

gem 'rails', '3.2.13'

#sqlite for dev
group :development do
  gem 'sqlite3'
end

#PG for Heroku

group :production do
  gem 'pg'
end

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'


gem 'json'

# view templates. replacement for ERB.
# http://haml-lang.com/
gem 'haml'
# needed for using haml in rails generators
gem 'haml-rails'

# https://github.com/thomas-mcdonald/bootstrap-sass
gem 'bootstrap-sass', '~> 3.1.1'

gem 'jquery-rails', '2.3.0'
gem 'underscore-rails'


# Heroku gem for producing and syncing error pages
gem 'trackman'

# New Relic is a performance management system, developed by New Relic, Inc (http://www.newrelic.com). It provides
# you with deep information about the performance of your Rails or Ruby application as it runs in production.
# The New Relic Ruby Agent is dual-purposed as a either a Rails plugin or a Gem, hosted on github.
# https://github.com/newrelic/rpm
gem 'newrelic_rpm'

# https://github.com/gregbell/active_admin
# Docs: http://activeadmin.info/documentation.html
# Active Admin is a framework for creating administration style interfaces. It abstracts common business
# application patterns to make it simple for developers to implement beautiful and elegant interfaces with
# very little effort.
gem 'activeadmin'
gem 'meta_search',    '>= 1.1.0.pre'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
  gem 'hogan_assets'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'
