if yes? "Do you want to use handlebars_assets?"
  gem "handlebars_assets", group: [:assets]

  stategies << lambda do
    puts "Beginning handlebars install"
    manifest = @use_coffee_script ? "application.js.coffee" : "application.js"
    insert_into_file "app/assets/javascripts/#{ manifest }", :before => "//= require_tree ../templates\n" do
      "//= require handlebars\n"
    end
  end
end

