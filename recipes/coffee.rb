@use_coffee_script = unless no? "Do you want to use coffee-rails"
  comment_lines 'Gemfile', /gem 'coffee-rails'/
end
