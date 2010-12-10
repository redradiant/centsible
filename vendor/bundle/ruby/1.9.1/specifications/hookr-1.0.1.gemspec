# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{hookr}
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Avdi Grimm"]
  s.date = %q{2008-12-02}
  s.default_executable = %q{hookr}
  s.description = %q{HookR is a publish/subscribe callback hook facility for Ruby.}
  s.email = %q{avdi@avdi.org}
  s.executables = ["hookr"]
  s.extra_rdoc_files = ["History.txt", "README.txt", "bin/hookr"]
  s.files = ["History.txt", "Manifest.txt", "README.txt", "Rakefile", "bin/hookr", "lib/hookr.rb", "spec/hookr_spec.rb", "spec/spec_helper.rb", "tasks/ann.rake", "tasks/bones.rake", "tasks/gem.rake", "tasks/git.rake", "tasks/manifest.rake", "tasks/notes.rake", "tasks/post_load.rake", "tasks/rdoc.rake", "tasks/rubyforge.rake", "tasks/setup.rb", "tasks/spec.rake", "tasks/svn.rake", "tasks/test.rake", "test/test_hookr.rb"]
  s.homepage = %q{http://hookr.rubyforge.org}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{hookr}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{HookR is a publish/subscribe callback hook facility for Ruby}
  s.test_files = ["test/test_hookr.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<fail-fast>, [">= 1.0.0"])
      s.add_development_dependency(%q<bones>, [">= 2.1.0"])
    else
      s.add_dependency(%q<fail-fast>, [">= 1.0.0"])
      s.add_dependency(%q<bones>, [">= 2.1.0"])
    end
  else
    s.add_dependency(%q<fail-fast>, [">= 1.0.0"])
    s.add_dependency(%q<bones>, [">= 2.1.0"])
  end
end
