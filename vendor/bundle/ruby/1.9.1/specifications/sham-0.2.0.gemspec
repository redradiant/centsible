# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{sham}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Pan Thomakos"]
  s.date = %q{2010-12-05}
  s.description = %q{Lightweight flexible factories for Ruby on Rails testing.}
  s.email = ["pan.thomakos@gmail.com"]
  s.extra_rdoc_files = ["README.markdown", "License.txt"]
  s.files = [".document", ".gitignore", "Gemfile", "License.txt", "README.markdown", "Rakefile", "lib/sham.rb", "lib/sham/version.rb", "sham.gemspec"]
  s.homepage = %q{http://github.com/panthomakos/sham}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{sham}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{sham-0.2.0}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
