# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{asin}
  s.version = "0.0.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Peter Schröder"]
  s.date = %q{2010-08-05}
  s.description = %q{Amazon Simple INterface or whatever you want to call this.}
  s.email = %q{phoetmail@googlemail.com}
  s.files = ["lib/asin.rb", "README.rdoc", "test/test_asin.rb", "test/test_helper.rb"]
  s.homepage = %q{http://github.com/phoet/asin}
  s.rdoc_options = ["-a", "--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Simple interface to Amazon Item lookup.}
  s.test_files = ["test/test_asin.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<crack>, [">= 0.1.0"])
      s.add_runtime_dependency(%q<hashie>, [">= 0.2.0"])
      s.add_runtime_dependency(%q<httpclient>, [">= 2.1.0"])
    else
      s.add_dependency(%q<crack>, [">= 0.1.0"])
      s.add_dependency(%q<hashie>, [">= 0.2.0"])
      s.add_dependency(%q<httpclient>, [">= 2.1.0"])
    end
  else
    s.add_dependency(%q<crack>, [">= 0.1.0"])
    s.add_dependency(%q<hashie>, [">= 0.2.0"])
    s.add_dependency(%q<httpclient>, [">= 2.1.0"])
  end
end
