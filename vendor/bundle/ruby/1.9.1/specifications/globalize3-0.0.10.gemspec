# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{globalize3}
  s.version = "0.0.10"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sven Fuchs", "Joshua Harvey", "Clemens Kofler", "John-Paul Bader"]
  s.date = %q{2010-11-29}
  s.description = %q{Rails I18n: de-facto standard library for ActiveRecord 3 model/data translation.}
  s.email = %q{nobody@globalize-rails.org}
  s.files = ["lib/globalize/active_record/act_macro.rb", "lib/globalize/active_record/adapter.rb", "lib/globalize/active_record/attributes.rb", "lib/globalize/active_record/class_methods.rb", "lib/globalize/active_record/exceptions.rb", "lib/globalize/active_record/instance_methods.rb", "lib/globalize/active_record/migration.rb", "lib/globalize/active_record/translation.rb", "lib/globalize/active_record.rb", "lib/globalize/versioning/vestal_versions.rb", "lib/globalize/versioning.rb", "lib/globalize.rb", "lib/globalize3/version.rb", "lib/globalize3.rb", "lib/i18n/missing_translations_log_handler.rb", "lib/i18n/missing_translations_raise_handler.rb", "lib/patches/active_record/query_method.rb", "lib/patches/active_record/xml_attribute_serializer.rb", "Gemfile", "Gemfile.lock", "LICENSE", "Rakefile", "README.textile"]
  s.homepage = %q{http://github.com/svenfuchs/globalize3}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{[none]}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Rails I18n: de-facto standard library for ActiveRecord 3 model/data translation}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 3.0.0"])
      s.add_runtime_dependency(%q<activemodel>, [">= 3.0.0"])
      s.add_development_dependency(%q<database_cleaner>, ["= 0.5.2"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<pathname_local>, [">= 0"])
      s.add_development_dependency(%q<test_declarative>, [">= 0"])
      s.add_development_dependency(%q<ruby-debug>, [">= 0"])
      s.add_development_dependency(%q<sqlite3-ruby>, [">= 0"])
    else
      s.add_dependency(%q<activerecord>, [">= 3.0.0"])
      s.add_dependency(%q<activemodel>, [">= 3.0.0"])
      s.add_dependency(%q<database_cleaner>, ["= 0.5.2"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<pathname_local>, [">= 0"])
      s.add_dependency(%q<test_declarative>, [">= 0"])
      s.add_dependency(%q<ruby-debug>, [">= 0"])
      s.add_dependency(%q<sqlite3-ruby>, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 3.0.0"])
    s.add_dependency(%q<activemodel>, [">= 3.0.0"])
    s.add_dependency(%q<database_cleaner>, ["= 0.5.2"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<pathname_local>, [">= 0"])
    s.add_dependency(%q<test_declarative>, [">= 0"])
    s.add_dependency(%q<ruby-debug>, [">= 0"])
    s.add_dependency(%q<sqlite3-ruby>, [">= 0"])
  end
end
