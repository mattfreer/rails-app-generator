#run "bundle install"
run "cp config/database.yml config/database.yml.example"
current_user = %x{whoami}.strip
db_user = ask("Database owner? [#{ current_user }(default), other(specify)]: ").downcase
db_user = db_user.present? ? db_user : current_user
puts db_user
gsub_file 'config/database.yml', /\b(#{app_name})\b/i, "#{ db_user }"
db_command = 'bundle exec rake db:create'

stategies << lambda do
  run db_command
end

