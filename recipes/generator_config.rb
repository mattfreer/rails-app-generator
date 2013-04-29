generators_configuration = <<-END
config.generators do |g|
  g.test_framework :rspec, :fixture => true, :views => false
  g.fixture_replacement :factory_girl, :dir => "spec/factories"
  g.stylesheets false
  g.javascripts false
end
END

environment generators_configuration
