require 'bundler/setup'
require 'rake'

# RSpec
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

desc 'Update dependencies'
task :update do
  token = ENV['GITHUB_ACCESS_TOKEN']

  sh 'cd /app/tmp'
  sh 'git clone https://github.com/Tomohiro/fluentular'
  sh 'cd fluentular'
  sh 'git config user.name "Tomohiro TAIRA"'
  sh 'git config user.email "tomohiro.t@gmail.com"'
  sh 'bundle install --path vendor/bundle'
  sh 'git checkout -b update-bundles'
  sh 'bundle update'
  sh 'git add .'
  sh 'git commit -m "Update bundle gems"'
  sh "git push https://#{token}:x-oauth-basic@github.com/Tomohiro/fluentular update-bundles"
end
