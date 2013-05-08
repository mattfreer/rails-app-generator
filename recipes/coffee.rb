if no? "Do you want to use coffee-rails"
  @use_coffee_script = false
  comment_lines 'Gemfile', /gem 'coffee-rails'/
else
  @use_coffee_script = true
end
