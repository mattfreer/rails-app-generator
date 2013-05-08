generators_configuration = <<-END
config.generators do |g|
  g.test_framework :rspec, :fixture => true, :views => false
  g.fixture_replacement :factory_girl, :dir => "spec/factories"
  g.stylesheets false
  g.javascripts false

  #whether to use javascript rather than coffee for backbone generators by default
  #{@use_coffee_script ? 'g.javascript false' : 'g.javascript true'}
end
END

environment generators_configuration
