# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{alter-ego}
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Avdi Grimm"]
  s.date = %q{2009-07-18}
  s.description = %q{AlterEgo is a Ruby implementation of the State pattern as described by the Gang of Four.  It differs from other Ruby state machine libraries in that it focuses on providing polymorphic behavior based on object state.  In effect, it makes it easy to give an object different personalities depending on the state it is in.}
  s.email = ["avdi@avdi.org"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc"]
  s.files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc", "State_Design_Pattern_UML_Class_Diagram.png", "Rakefile", "TODO", "lib/alter_ego.rb", "script/console", "script/destroy", "script/generate", "spec/spec.opts", "spec/spec_helper.rb", "spec/alter_ego_spec.rb", "tasks/rspec.rake"]
  s.homepage = %q{http://alter-ego.rubyforge.org}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{alter-ego}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{AlterEgo is a Ruby implementation of the State pattern as described by the Gang of Four}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<fail-fast>, ["~> 1.1.0"])
      s.add_runtime_dependency(%q<hookr>, ["~> 1.0.0"])
      s.add_development_dependency(%q<newgem>, [">= 1.3.0"])
      s.add_development_dependency(%q<hoe>, [">= 1.8.0"])
    else
      s.add_dependency(%q<fail-fast>, ["~> 1.1.0"])
      s.add_dependency(%q<hookr>, ["~> 1.0.0"])
      s.add_dependency(%q<newgem>, [">= 1.3.0"])
      s.add_dependency(%q<hoe>, [">= 1.8.0"])
    end
  else
    s.add_dependency(%q<fail-fast>, ["~> 1.1.0"])
    s.add_dependency(%q<hookr>, ["~> 1.0.0"])
    s.add_dependency(%q<newgem>, [">= 1.3.0"])
    s.add_dependency(%q<hoe>, [">= 1.8.0"])
  end
end
