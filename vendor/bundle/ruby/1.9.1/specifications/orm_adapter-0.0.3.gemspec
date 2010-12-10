# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{orm_adapter}
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ian White", "Jose Valim"]
  s.date = %q{2010-10-11}
  s.description = %q{Provides a single point of entry for using basic features of ruby ORMs}
  s.email = %q{ian.w.white@gmail.com}
  s.extra_rdoc_files = ["LICENSE", "README.rdoc"]
  s.files = [".gitignore", "Gemfile", "Gemfile.lock", "History.txt", "LICENSE", "README.rdoc", "Rakefile", "lib/orm_adapter.rb", "lib/orm_adapter/adapters/active_record.rb", "lib/orm_adapter/adapters/data_mapper.rb", "lib/orm_adapter/adapters/mongoid.rb", "lib/orm_adapter/base.rb", "lib/orm_adapter/to_adapter.rb", "lib/orm_adapter/version.rb", "orm_adapter.gemspec", "spec/orm_adapter/adapters/active_record_spec.rb", "spec/orm_adapter/adapters/data_mapper_spec.rb", "spec/orm_adapter/adapters/mongoid_spec.rb", "spec/orm_adapter/example_app_shared.rb", "spec/orm_adapter_spec.rb", "spec/spec_helper.rb"]
  s.homepage = %q{http://github.com/ianwhite/orm_adapter}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Provides a single point of entry for using basic features of ruby ORMs}
  s.test_files = ["spec/orm_adapter/adapters/active_record_spec.rb", "spec/orm_adapter/adapters/data_mapper_spec.rb", "spec/orm_adapter/adapters/mongoid_spec.rb", "spec/orm_adapter/example_app_shared.rb", "spec/orm_adapter_spec.rb", "spec/spec_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
