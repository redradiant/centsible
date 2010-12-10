# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rails3-generators}
  s.version = "0.14.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jose Valim", "Anuj Dutta", "Paul Berry", "Jeff Tucker", "Louis T.", "Jai-Gouk Kim", "Darcy Laycock", "Peter Haza", "Peter Gumeson", "Kristian Mandrup", "Alejandro Juarez"]
  s.date = %q{2010-10-01}
  s.description = %q{Rails 3 compatible generators for DataMapper, Factory-girl, Authlogic, Mongomapper, Mongoid, Shoulda, Formtastic, SimpleForm and Fabrication}
  s.email = %q{andre@arko.net}
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = [".gitignore", "CHANGELOG.rdoc", "Gemfile", "README.rdoc", "Rakefile", "VERSION", "lib/generators/authlogic.rb", "lib/generators/authlogic/session/session_generator.rb", "lib/generators/authlogic/session/templates/session.rb", "lib/generators/data_mapper.rb", "lib/generators/data_mapper/migration/migration_generator.rb", "lib/generators/data_mapper/migration/templates/migration.rb", "lib/generators/data_mapper/model/model_generator.rb", "lib/generators/data_mapper/model/templates/migration.rb", "lib/generators/data_mapper/model/templates/model.rb", "lib/generators/data_mapper/observer/observer_generator.rb", "lib/generators/data_mapper/observer/templates/observer.rb", "lib/generators/erubis.rb", "lib/generators/erubis/controller/controller_generator.rb", "lib/generators/erubis/controller/templates/view.html.erb", "lib/generators/erubis/scaffold/scaffold_generator.rb", "lib/generators/erubis/scaffold/templates/_form.html.erb", "lib/generators/erubis/scaffold/templates/edit.html.erb", "lib/generators/erubis/scaffold/templates/index.html.erb", "lib/generators/erubis/scaffold/templates/new.html.erb", "lib/generators/erubis/scaffold/templates/show.html.erb", "lib/generators/fabrication.rb", "lib/generators/fabrication/model/model_generator.rb", "lib/generators/fabrication/model/templates/fabricator.rb", "lib/generators/factory_girl.rb", "lib/generators/factory_girl/model/model_generator.rb", "lib/generators/factory_girl/model/templates/fixtures.rb", "lib/generators/formtastic.rb", "lib/generators/formtastic/scaffold/scaffold_generator.rb", "lib/generators/formtastic/scaffold/templates/_form.html.erb.erb", "lib/generators/formtastic/scaffold/templates/_form.html.haml.erb", "lib/generators/helpers/migration_helper.rb", "lib/generators/helpers/model_helper.rb", "lib/generators/koala.rb", "lib/generators/koala/install/install_generator.rb", "lib/generators/koala/install/templates/app/helpers/facebook_helper.rb.tt", "lib/generators/koala/install/templates/config/facebook.yml.tt", "lib/generators/koala/install/templates/config/initializers/koala.rb.tt", "lib/generators/machinist.rb", "lib/generators/machinist/model/model_generator.rb", "lib/generators/machinist/model/templates/blueprint.rb", "lib/generators/machinist/model/templates/machinist_initializer.rb", "lib/generators/mongo_mapper.rb", "lib/generators/mongo_mapper/.DS_Store", "lib/generators/mongo_mapper/install/install_generator.rb", "lib/generators/mongo_mapper/install/templates/database.mongo.yml", "lib/generators/mongo_mapper/install/templates/mongo_mapper.rb", "lib/generators/mongo_mapper/model/model_generator.rb", "lib/generators/mongo_mapper/model/templates/model.rb", "lib/generators/mongo_mapper/observer/observer_generator.rb", "lib/generators/mongo_mapper/observer/templates/observer.rb", "lib/generators/mongoid.rb", "lib/generators/mongoid/install/install_generator.rb", "lib/generators/mongoid/install/templates/database.mongo.yml", "lib/generators/mongoid/install/templates/mongoid.rb", "lib/generators/mongoid/model/model_generator.rb", "lib/generators/mongoid/model/templates/model.rb", "lib/generators/mustache.rb", "lib/generators/mustache/README.md", "lib/generators/mustache/controller/controller_generator.rb", "lib/generators/mustache/controller/templates/view.html.mustache.erb", "lib/generators/mustache/controller/templates/view.rb.erb", "lib/generators/mustache/install/install_generator.rb", "lib/generators/mustache/install/templates/config/initializers/mustache.rb", "lib/generators/mustache/install/templates/lib/mustache_rails.rb", "lib/generators/mustache/scaffold/scaffold_generator.rb", "lib/generators/mustache/scaffold/templates/_form.html.mustache.erb", "lib/generators/mustache/scaffold/templates/edit.html.mustache.erb", "lib/generators/mustache/scaffold/templates/edit.rb.erb", "lib/generators/mustache/scaffold/templates/index.html.mustache.erb", "lib/generators/mustache/scaffold/templates/index.rb.erb", "lib/generators/mustache/scaffold/templates/new.html.mustache.erb", "lib/generators/mustache/scaffold/templates/new.rb.erb", "lib/generators/mustache/scaffold/templates/show.html.mustache.erb", "lib/generators/mustache/scaffold/templates/show.rb.erb", "lib/generators/shoulda.rb", "lib/generators/shoulda/controller/controller_generator.rb", "lib/generators/shoulda/controller/templates/controller.rb", "lib/generators/shoulda/model/model_generator.rb", "lib/generators/shoulda/model/templates/model.rb", "lib/generators/simple_form.rb", "lib/generators/simple_form/scaffold/scaffold_generator.rb", "lib/generators/simple_form/scaffold/templates/_form.html.erb.erb", "lib/generators/simple_form/scaffold/templates/_form.html.haml.erb", "lib/rails3-generators.rb", "rails3-generators.gemspec", "test/fixtures/routes.rb", "test/lib/generators/authlogic/session_generator_test.rb", "test/lib/generators/data_mapper/migration_generator_test.rb", "test/lib/generators/data_mapper/model_generator_test.rb", "test/lib/generators/data_mapper/observer_generator_test.rb", "test/lib/generators/erubis/controller_generator_test.rb", "test/lib/generators/erubis/scaffold_generator_test.rb", "test/lib/generators/fabrication/model_generator_test.rb", "test/lib/generators/factory_girl/model_generator_test.rb", "test/lib/generators/formtastic/scaffold_generators_test.rb", "test/lib/generators/koala/install_generator_test.rb", "test/lib/generators/machinist/model_generator_test.rb", "test/lib/generators/mongo_mapper/install_generator_test.rb", "test/lib/generators/mongo_mapper/model_generator_test.rb", "test/lib/generators/mongo_mapper/observer_generator_test.rb", "test/lib/generators/mongo_mapper/testing_helper.rb", "test/lib/generators/mongoid/install_generator_test.rb", "test/lib/generators/mongoid/model_generator_test.rb", "test/lib/generators/mongoid/testing_helper.rb", "test/lib/generators/mustache/controller_generator_test.rb", "test/lib/generators/mustache/scaffold_generator_test.rb", "test/lib/generators/mustache/testing_helper.rb", "test/lib/generators/shoulda/controller_generator_test.rb", "test/lib/generators/simple_form/scaffold_generators_test.rb", "test/test_helper.rb"]
  s.homepage = %q{http://github.com/indirect/rails3-generators}
  s.post_install_message = %q{
rails3-generators-0.14.0

Be sure to check out the wiki, http://wiki.github.com/indirect/rails3-generators/,
for information about recent changes to this project.

The Haml generators have moved to {the haml-rails gem}[http://github.com/indirect/haml-rails].
The jQuery generators have moved to {the jquery-rails gem}[http://github.com/indirect/jquery-rails].

}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Rails 3 compatible generators}
  s.test_files = ["test/fixtures/routes.rb", "test/lib/generators/authlogic/session_generator_test.rb", "test/lib/generators/data_mapper/migration_generator_test.rb", "test/lib/generators/data_mapper/model_generator_test.rb", "test/lib/generators/data_mapper/observer_generator_test.rb", "test/lib/generators/erubis/controller_generator_test.rb", "test/lib/generators/erubis/scaffold_generator_test.rb", "test/lib/generators/fabrication/model_generator_test.rb", "test/lib/generators/factory_girl/model_generator_test.rb", "test/lib/generators/formtastic/scaffold_generators_test.rb", "test/lib/generators/koala/install_generator_test.rb", "test/lib/generators/machinist/model_generator_test.rb", "test/lib/generators/mongo_mapper/install_generator_test.rb", "test/lib/generators/mongo_mapper/model_generator_test.rb", "test/lib/generators/mongo_mapper/observer_generator_test.rb", "test/lib/generators/mongo_mapper/testing_helper.rb", "test/lib/generators/mongoid/install_generator_test.rb", "test/lib/generators/mongoid/model_generator_test.rb", "test/lib/generators/mongoid/testing_helper.rb", "test/lib/generators/mustache/controller_generator_test.rb", "test/lib/generators/mustache/scaffold_generator_test.rb", "test/lib/generators/mustache/testing_helper.rb", "test/lib/generators/shoulda/controller_generator_test.rb", "test/lib/generators/simple_form/scaffold_generators_test.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
