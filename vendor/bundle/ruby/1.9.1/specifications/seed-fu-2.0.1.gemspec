# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{seed-fu}
  s.version = "2.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Michael Bleigh", "Jon Leighton"]
  s.date = %q{2010-11-04}
  s.description = %q{Seed Fu is an attempt to once and for all solve the problem of inserting and maintaining seed data in a database. It uses a variety of techniques gathered from various places around the web and combines them to create what is hopefully the most robust seed data system around.}
  s.email = ["michael@intridea.com", "j@jonathanleighton.com"]
  s.files = ["lib/tasks/seed_fu.rake", "lib/seed-fu/block_hash.rb", "lib/seed-fu/runner.rb", "lib/seed-fu/active_record_extension.rb", "lib/seed-fu/seeder.rb", "lib/seed-fu/railtie.rb", "lib/seed-fu/version.rb", "lib/seed-fu/writer.rb", "lib/seed-fu.rb", "LICENSE", "README.md", "CHANGELOG.md"]
  s.homepage = %q{http://github.com/mbleigh/seed-fu}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Easily manage seed data in your Active Record application}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, ["~> 3.0.0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.0.0"])
      s.add_development_dependency(%q<pg>, [">= 0"])
      s.add_development_dependency(%q<mysql2>, [">= 0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
    else
      s.add_dependency(%q<activerecord>, ["~> 3.0.0"])
      s.add_dependency(%q<rspec>, ["~> 2.0.0"])
      s.add_dependency(%q<pg>, [">= 0"])
      s.add_dependency(%q<mysql2>, [">= 0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>, ["~> 3.0.0"])
    s.add_dependency(%q<rspec>, ["~> 2.0.0"])
    s.add_dependency(%q<pg>, [">= 0"])
    s.add_dependency(%q<mysql2>, [">= 0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
  end
end
