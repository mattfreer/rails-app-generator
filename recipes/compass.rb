gem "compass-rails", group: [:assets]
compass_command = "bundle exec compass init"

file_path = "app/assets/stylesheets/application.css"
remove_file file_path
create_file file_path
append_file file_path, load_template('application','compass')

stategies << lambda do
  run compass_command
end
