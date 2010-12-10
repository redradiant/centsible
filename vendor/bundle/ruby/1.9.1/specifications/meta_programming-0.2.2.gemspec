# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{meta_programming}
  s.version = "0.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jeff Patmon"]
  s.date = %q{2010-05-28}
  s.description = %q{Collection of meta-programming methods for Ruby}
  s.email = %q{jpatmon@gmail.com}
  s.files = ["lib/meta_programming/class.rb", "lib/meta_programming/object.rb", "lib/meta_programming.rb", "spec/meta_programming_spec.rb", "spec/ghost_methods_spec.rb", "spec/spec_helper.rb", "spec/blank_slate_spec.rb", "spec/spec.opts", "spec/dynamic_proxy_spec.rb", "init.rb", "LICENSE", "Rakefile", "README.rdoc", ".gitignore"]
  s.homepage = %q{http://github.com/jeffp/meta_programming/tree/master}
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Collection of meta-programming methods for Ruby}
  s.test_files = ["spec/meta_programming_spec.rb", "spec/ghost_methods_spec.rb", "spec/blank_slate_spec.rb", "spec/dynamic_proxy_spec.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
