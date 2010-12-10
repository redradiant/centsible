# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rdiscount}
  s.version = "1.6.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryan Tomayko", "David Loren Parsons", "Andrew White"]
  s.date = %q{2010-06-15}
  s.default_executable = %q{rdiscount}
  s.email = %q{rtomayko@gmail.com}
  s.executables = ["rdiscount"]
  s.extensions = ["ext/extconf.rb"]
  s.extra_rdoc_files = ["COPYING"]
  s.files = ["COPYING", "README.markdown", "Rakefile", "bin/rdiscount", "ext/Csio.c", "ext/amalloc.h", "ext/basename.c", "ext/config.h", "ext/css.c", "ext/cstring.h", "ext/docheader.c", "ext/dumptree.c", "ext/emmatch.c", "ext/extconf.rb", "ext/generate.c", "ext/html5.c", "ext/markdown.c", "ext/markdown.h", "ext/mkdio.c", "ext/mkdio.h", "ext/rdiscount.c", "ext/resource.c", "ext/tags.c", "ext/tags.h", "ext/toc.c", "ext/xml.c", "lib/markdown.rb", "lib/rdiscount.rb", "man/markdown.7", "man/rdiscount.1", "man/rdiscount.1.ronn", "rdiscount.gemspec", "test/benchmark.rb", "test/benchmark.txt", "test/markdown_test.rb", "test/rdiscount_test.rb"]
  s.homepage = %q{http://github.com/rtomayko/rdiscount}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{wink}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Fast Implementation of Gruber's Markdown in C}
  s.test_files = ["test/markdown_test.rb", "test/rdiscount_test.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
