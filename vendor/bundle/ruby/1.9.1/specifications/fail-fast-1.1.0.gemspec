# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{fail-fast}
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Avdi Grimm"]
  s.date = %q{2009-07-18}
  s.description = %q{FailFast is a collection of assertion methods intended for lightweight contract checking.}
  s.email = ["avdi@avdi.org"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc", "website/index.txt"]
  s.files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc", "Rakefile", "config/website.yml", "lib/fail_fast.rb", "script/console", "script/destroy", "script/generate", "script/txt2html", "spec/fail_fast_spec.rb", "spec/spec.opts", "spec/spec_helper.rb", "tasks/rspec.rake", "website/index.html", "website/index.txt", "website/javascripts/rounded_corners_lite.inc.js", "website/stylesheets/screen.css", "website/template.html.erb"]
  s.homepage = %q{http://fail-fast.rubyforge.org}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{fail-fast}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{FailFast is a collection of assertion methods intended for lightweight contract checking.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<newgem>, [">= 1.3.0"])
      s.add_development_dependency(%q<hoe>, [">= 1.8.0"])
    else
      s.add_dependency(%q<newgem>, [">= 1.3.0"])
      s.add_dependency(%q<hoe>, [">= 1.8.0"])
    end
  else
    s.add_dependency(%q<newgem>, [">= 1.3.0"])
    s.add_dependency(%q<hoe>, [">= 1.8.0"])
  end
end
