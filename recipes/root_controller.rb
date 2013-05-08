if yes? "Do you want to generate a root controller?"
  default_name = 'home'
  name = ask("What should it be called? [#{ default_name }(default), other(specify)]").underscore
  name = name.present? ? name : default_name
  route "root to: '#{name}\#index'"
  remove_file "public/index.html"
  generate_command = "rails generate controller #{name} index --assets false --helper false --view-specs false"

  stategies << lambda do
    run generate_command
  end
end

