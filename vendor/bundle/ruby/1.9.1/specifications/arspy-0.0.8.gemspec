# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{arspy}
  s.version = "0.0.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jeff Patmon"]
  s.date = %q{2010-04-29}
  s.description = %q{Active Record Spy}
  s.email = %q{jpatmon@gmail.com}
  s.files = ["lib/meta_programming/object.rb", "lib/arspy/operators/attribute_test/range_test.rb", "lib/arspy/operators/attribute_test/integer_test.rb", "lib/arspy/operators/attribute_test/string_test.rb", "lib/arspy/operators/attribute_test/base.rb", "lib/arspy/operators/attribute_test/regexp_test.rb", "lib/arspy/operators/attribute_test/float_test.rb", "lib/arspy/operators/attribute_test/unsupported_test.rb", "lib/arspy/operators/attribute_test.rb", "lib/arspy/operators/selector/hash_selector.rb", "lib/arspy/operators/selector/unsupported_selector.rb", "lib/arspy/operators/selector/base.rb", "lib/arspy/operators/selector/string_selector.rb", "lib/arspy/operators/selector/attribute_selector.rb", "lib/arspy/operators/selector/integer_selector.rb", "lib/arspy/operators/selector/range_selector.rb", "lib/arspy/operators/interpreter/method_interpreter.rb", "lib/arspy/operators/interpreter/null_interpreter.rb", "lib/arspy/operators/interpreter/base.rb", "lib/arspy/operators/interpreter/attribute_interpreter.rb", "lib/arspy/operators/interpreter/association_interpreter.rb", "lib/arspy/operators/interpreter/abbreviated_association_interpreter.rb", "lib/arspy/operators/interpreter/abbreviated_attribute_interpreter.rb", "lib/arspy/operators/interpreter.rb", "lib/arspy/operators/abbreviations.rb", "lib/arspy/operators/selector.rb", "lib/arspy/class_extensions.rb", "lib/arspy/delegators/factory.rb", "lib/arspy/delegators/association_collection_extensions.rb", "lib/arspy/delegators/array_extensions.rb", "lib/arspy/delegators/null_extensions.rb", "lib/arspy/delegators/active_record_extensions.rb", "lib/arspy/delegators.rb", "lib/arspy/operators.rb", "lib/meta_programming.rb", "lib/arspy.rb", "spec/list_field_spec.rb", "spec/spec_helper.rb", "spec/with_command_spec.rb", "spec/active_record.log", "spec/list_association_spec.rb", "spec/database.rb", "init.rb", "LICENSE", "Rakefile", "README.rdoc", ".gitignore"]
  s.homepage = %q{http://github.com/jeffp/arspy/tree/master}
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Rails console command line tool for browsing and inspecting the structure, associations and data of an ActiveRecord data model.}
  s.test_files = ["spec/list_field_spec.rb", "spec/with_command_spec.rb", "spec/list_association_spec.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<awesome_print>, [">= 0.1.4"])
    else
      s.add_dependency(%q<awesome_print>, [">= 0.1.4"])
    end
  else
    s.add_dependency(%q<awesome_print>, [">= 0.1.4"])
  end
end
