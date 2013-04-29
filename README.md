#Opinionated Rails Template

This template provides some opinionated defaults for new Ruby on Rails 3 applications. It is inspired by [madebydna/rails-templater](http://github.com/madebydna/rails-templater).

##Usage
Firstly clone this repo to your local machine:
```ruby
git clone git@github.com:mattfreer/rails-app-generator.git app_generator
```

Then when creating you new Rails application point it to the template using the `-m` switch
```ruby
rails new blog -d postgresql -m ./app_generator/template.rb
```

