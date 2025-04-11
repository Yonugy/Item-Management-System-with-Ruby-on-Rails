source "https://rubygems.org"

gem "rails", "~> 8.0.2"
gem "puma", ">= 5.0"
gem "pg", "~> 1.3" # PostgreSQL gem
gem "bcrypt", "~> 3.1.7" # Added bcrypt for secure passwords
gem "rack-cors"
gem "graphql"
gem "dotenv-rails", groups: [:development, :test, :production]

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

gem "graphiql-rails", "~> 1.8"
gem "bootsnap", require: false
gem "kamal", require: false
gem "thruster", require: false
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"
gem "tzinfo-data", platforms: %i[windows mingw x64_mingw]

