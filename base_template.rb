remove_file "README.rdoc"
create_file "README.md"

#RVM
if yes? "Do you want to create a .rvmrc file for this project?"
  create_file ".rvmrc"

  current_ruby = %x{rvm current | cut -d'@' -f 1}.strip
  gemset_name = %x{rvm gemset name}.strip

  append_file ".rvmrc" do
    "rvm use #{current_ruby}@#{gemset_name}"
  end
end

#Gitignore
remove_file ".gitignore"
file ".gitignore", <<-END
.bundle
*.rvmrc
db/*.sqlite3*
log/*.log
*.log
tmp/**/*
tmp/*
doc/api
doc/app
*.swp
*.swo
*.swn
*~
.DS_Store
Capfile
.sass-cache/
config/database.yml
END


#DEBUGGER
gem "debugger", group: [:test, :development]


#Database
run "bundle install"
run "cp config/database.yml config/database.yml.example"
current_user = %x{whoami}.strip
db_user = ask("Database owner? [#{ current_user }(default), other(specify)]: ").downcase
db_user = db_user.present? ? db_user : current_user
puts db_user
gsub_file 'config/database.yml', /\b(#{app_name})\b/i, "#{ db_user }"
rake("db:create")
if yes? "Do you want to generate a root controller?"
  name = ask("What should it be called?").underscore
  generate :controller, "#{name} index --assets false --helper false --view-specs false"
  route "root to: '#{name}\#index'"
  remove_file "public/index.html"
end

use_coffee_script = unless no? "Do you want to use coffee-rails"
  comment_lines 'Gemfile', /gem 'coffee-rails'/
end

if yes? "Do you want to use rails-backbone"
  if use_coffee_script
    gem "rails-backbone"
  else
    comment_lines 'Gemfile', /gem 'jquery-rails'/
    gem "jquery-rails", "~> 2.2.1"

    gem "rails-backbone",
      :git => "git@github.com:mattfreer/backbone-rails.git",
      :branch => "patch-1"
  end
  run "bundle install"
  generate "backbone:install"
end

#COMPASS
gem "compass-rails", group: [:assets]
run "bundle install"
run "bundle exec compass init"

remove_file "app/assets/stylesheets/application.css"
file "app/assets/stylesheets/application.scss", <<-END
//@import "compass/css3";
//Example: import partial stylesheet named "_users.scss"
//@import "users";
END

#RSPEC
remove_file "test" unless options["skip_test_unit"]
gem "rspec-rails", group: [:test, :development]
run "bundle install"
generate "rspec:install"

#Git
run "git flow init -d"
