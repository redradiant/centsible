# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{isolate-scenarios}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Joshua Nichols"]
  s.date = %q{2010-11-05}
  s.default_executable = %q{isolate-scenarios}
  s.description = %q{Tool for testing libraries using different senarios of gem versions}
  s.email = %q{josh@technicalpickles.com}
  s.executables = ["isolate-scenarios"]
  s.extra_rdoc_files = ["LICENSE", "README.rdoc"]
  s.files = [".document", ".gitignore", "Gemfile", "Gemfile.lock", "Isolate", "LICENSE", "README.rdoc", "Rakefile", "bin/isolate-scenarios", "isolate-scenarios.gemspec", "lib/isolate-scenarios.rb", "lib/isolate/scenarios.rb", "lib/isolate/scenarios/cli.rb", "lib/isolate/scenarios/extensions.rb", "spec/isolate-scenarios_spec.rb", "spec/spec.opts", "spec/spec_helper.rb"]
  s.homepage = %q{http://github.com/technicalpickles/isolate-scenarios}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Tool for testing libraries using different senarios of gem versions}
  s.test_files = ["spec/isolate-scenarios_spec.rb", "spec/spec_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<thor>, ["~> 0.14.0"])
      s.add_runtime_dependency(%q<isolate>, ["~> 2.1.2"])
      s.add_development_dependency(%q<rspec>, ["~> 1.3.0"])
      s.add_development_dependency(%q<yard>, ["~> 0.6.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.0.pre5"])
    else
      s.add_dependency(%q<thor>, ["~> 0.14.0"])
      s.add_dependency(%q<isolate>, ["~> 2.1.2"])
      s.add_dependency(%q<rspec>, ["~> 1.3.0"])
      s.add_dependency(%q<yard>, ["~> 0.6.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.0.pre5"])
    end
  else
    s.add_dependency(%q<thor>, ["~> 0.14.0"])
    s.add_dependency(%q<isolate>, ["~> 2.1.2"])
    s.add_dependency(%q<rspec>, ["~> 1.3.0"])
    s.add_dependency(%q<yard>, ["~> 0.6.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.0.pre5"])
  end
end
