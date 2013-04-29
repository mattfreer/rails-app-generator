if yes? "Do you want to generate a root controller?"
  name = ask("What should it be called?").underscore
  route "root to: '#{name}\#index'"
  remove_file "public/index.html"
  generate_command = "rails generate controller #{name} index --assets false --helper false --view-specs false"

  stategies << lambda do
    run generate_command
  end
end

