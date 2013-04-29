gem "compass-rails", group: [:assets]
compass_command = "bundle exec compass init"

file_path = "app/assets/stylesheets/application"
remove_file "#{file_path}.css"
create_file "#{file_path}.scss"
append_file "#{file_path}.scss", load_template('application','compass')

stategies << lambda do
  run compass_command
end
