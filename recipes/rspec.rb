remove_file "test" unless options["skip_test_unit"]
gem "rspec-rails", group: [:test, :development]
#run "bundle install"
rspec_command = "rspec:install"

stategies << lambda do
  puts "Beginning RSpec install"
  generate rspec_command
end
