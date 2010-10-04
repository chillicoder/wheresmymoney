source :rubygems

# Project requirements
gem 'rake'
gem 'rack-flash'
gem 'thin' # or mongrel

# Component requirements
gem 'haml'
gem 'activerecord', :require => "active_record"

group :production do
  gem 'pg'
end

group :development do
  gem 'sqlite3-ruby', :require => "sqlite3"
end

group :test do
  gem 'spork'

  # Test requirements
  gem 'rspec', :require => "spec"
  gem 'rack-test', :require => "rack/test"
end

# Padrino
gem 'padrino', "0.9.17"
