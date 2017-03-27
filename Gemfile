git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

source 'https://rubygems.org'

# Specify your gem's dependencies in bloom_net_center_client.gemspec
gemspec

gem "pry-byebug"
