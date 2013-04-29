if yes? "Do you want to create a .rvmrc file for this project?"
  create_file ".rvmrc"

  current_ruby = %x{rvm current | cut -d'@' -f 1}.strip
  gemset_name = %x{rvm gemset name}.strip

  append_file ".rvmrc" do
    "rvm use #{current_ruby}@#{gemset_name}"
  end
end
