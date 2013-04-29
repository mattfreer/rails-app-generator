if yes? "Do you want to use simple_form?"
  gem "simple_form"
  simple_form_command = "rails generate simple_form:install"

  if yes? "Do you want to create a forms.scss partial with default form styles?"
    file_path = "app/assets/stylesheets/partials/_forms.scss"
    create_file "#{file_path}"
    append_file "#{file_path}", load_template('_forms.scss','simple_form')
    append_file "app/assets/stylesheets/application.scss", "@import 'partials/forms';"
  end

  stategies << lambda do
    run simple_form_command
  end
end
