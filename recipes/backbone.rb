def add_gitkeeps
  js_assets_path = "app/assets/javascripts"
  folders = %w(collections models views routers)

  folders.each do |folder|
    create_file "#{js_assets_path}/#{folder}/.gitkeep"
  end
end

if yes? "Do you want to use backbone-on-rails?"
  gem "backbone-on-rails"
  backbone_install_command = "rails generate backbone:install"
  backbone_install_command << " --javascript" unless @use_coffee_script

  stategies << lambda do
    puts "Beginning Backbone install"
    run backbone_install_command
    add_gitkeeps
  end

  apply recipe('backbone_support')
end

