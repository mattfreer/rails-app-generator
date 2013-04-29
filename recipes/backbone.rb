if yes? "Do you want to use backbone-on-rails?"
  gem "backbone-on-rails"
  backbone_install_command = "rails generate backbone:install --javascript"

  stategies << lambda do
    puts "Beginning Backbone install"
    run backbone_install_command
  end
end

