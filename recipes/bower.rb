if yes? "Do you want to use bower?"
  gem "bower-rails", "~> 0.4.0"
  bower_install_command = "rails g bower_rails:initialize"

  stategies << lambda do
    puts "Beginning Bower install"
    run bower_install_command
    add_gitkeeps
  end
end
