source 'https://rubygems.org'

gem 'rails', '3.2.8'

group :production, :staging do
  gem "mysql2"
end

group :development, :test do
	gem "sqlite3"
	gem 'sextant'
end

#for pagination
gem 'kaminari'
#for image upload
gem 'carrierwave'
gem "mini_magick"

#for form using "remote = true" and "multi-part = true" at the same time
gem 'remotipart'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'
gem 'capistrano-ext'

gem 'globalize3'


# To use debugger
# gem 'debugger'
