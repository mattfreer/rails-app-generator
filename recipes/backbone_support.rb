if yes? "Do you want to use backbone-support?"
  gem "backbone-support"

  stategies << lambda do
    puts "Beginning backbone-support install"
    manifest = "application.js"
    insert_into_file "app/assets/javascripts/#{ manifest }", :after => "//= require backbone\n" do
      <<-END
//= require backbone-support/support
//= require backbone-support/swapping_router
//= require backbone-support/observer
//= require backbone-support/composite_view
      END
    end
  end
end
