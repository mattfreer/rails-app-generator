require File.join(File.dirname(__FILE__), 'core_extensions.rb')

initialize_templater

required_recipes = %w(read_me rvm gitignore debugger database root_controller coffee backbone compass simple_form rspec factory_girl)
required_recipes.each {|required_recipe| apply recipe(required_recipe)}

inside app_name do
  run 'bundle install'
end

execute_stategies

apply recipe('generator_config')
apply recipe('git')
