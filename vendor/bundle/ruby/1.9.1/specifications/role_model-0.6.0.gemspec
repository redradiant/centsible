# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{role_model}
  s.version = "0.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Martin Rehfeld"]
  s.date = %q{2010-10-09}
  s.description = %q{Ever needed to assign roles to a model, say a User, and build conditional behaviour on top of that? Enter RoleModel -- roles have never been easier! Just declare your roles and you are done. Assigned roles will be stored as a bitmask.}
  s.email = %q{martin.rehfeld@glnetworks.de}
  s.extra_rdoc_files = ["LICENSE", "README.rdoc"]
  s.files = [".document", ".gitignore", "LICENSE", "README.rdoc", "Rakefile", "VERSION", "lib/role_model.rb", "lib/role_model/class_methods.rb", "lib/role_model/implementation.rb", "lib/role_model/roles.rb", "role_model.gemspec", "spec/custom_matchers.rb", "spec/custom_matchers_spec.rb", "spec/role_model_spec.rb", "spec/roles_spec.rb", "spec/spec.opts", "spec/spec_helper.rb"]
  s.homepage = %q{http://github.com/martinrehfeld/role_model}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Declare, assign and query roles with ease}
  s.test_files = ["spec/custom_matchers.rb", "spec/custom_matchers_spec.rb", "spec/role_model_spec.rb", "spec/roles_spec.rb", "spec/spec_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
    else
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
  end
end