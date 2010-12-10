# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{utility_belt}
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Giles Bowkett"]
  s.date = %q{2008-04-28}
  s.email = %q{gilesb@gmail.com}
  s.executables = ["amazon", "google", "pastie"]
  s.extra_rdoc_files = ["README"]
  s.files = ["bin", "bin/amazon", "bin/google", "bin/pastie", "History.txt", "html", "html/andreas00.css", "html/authorship.html", "html/bg.gif", "html/front.jpg", "html/index.html", "html/menubg.gif", "html/menubg2.gif", "html/test.jpg", "html/usage.html", "lib", "lib/utility_belt", "lib/utility_belt/amazon_upload_shortcut.rb", "lib/utility_belt/clipboard.rb", "lib/utility_belt/command_history.rb", "lib/utility_belt/convertable_to_file.rb", "lib/utility_belt/equipper.rb", "lib/utility_belt/google.rb", "lib/utility_belt/hash_math.rb", "lib/utility_belt/interactive_editor.rb", "lib/utility_belt/irb_options.rb", "lib/utility_belt/irb_verbosity_control.rb", "lib/utility_belt/is_an.rb", "lib/utility_belt/language_greps.rb", "lib/utility_belt/not.rb", "lib/utility_belt/pastie.rb", "lib/utility_belt/pipe.rb", "lib/utility_belt/prompt.rb", "lib/utility_belt/rails_finder_shortcut.rb", "lib/utility_belt/rails_verbosity_control.rb", "lib/utility_belt/string_to_proc.rb", "lib/utility_belt/symbol_to_proc.rb", "lib/utility_belt/wirble.rb", "lib/utility_belt/with.rb", "lib/utility_belt.rb", "Manifest.txt", "README", "spec", "spec/convertable_to_file_spec.rb", "spec/equipper_spec.rb", "spec/hash_math_spec.rb", "spec/interactive_editor_spec.rb", "spec/language_greps_spec.rb", "spec/pastie_spec.rb", "spec/pipe_spec.rb", "spec/spec_helper.rb", "spec/string_to_proc_spec.rb", "spec/utility_belt_spec.rb", "utility_belt.gemspec"]
  s.homepage = %q{http://utilitybelt.rubyforge.org}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{utility_belt}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A grab-bag of IRB power user madness.}
  s.test_files = ["spec/utility_belt_spec.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<wirble>, [">= 0.1.2"])
      s.add_runtime_dependency(%q<aws-s3>, [">= 0.4.0"])
      s.add_runtime_dependency(%q<Platform>, [">= 0.4.0"])
    else
      s.add_dependency(%q<wirble>, [">= 0.1.2"])
      s.add_dependency(%q<aws-s3>, [">= 0.4.0"])
      s.add_dependency(%q<Platform>, [">= 0.4.0"])
    end
  else
    s.add_dependency(%q<wirble>, [">= 0.1.2"])
    s.add_dependency(%q<aws-s3>, [">= 0.4.0"])
    s.add_dependency(%q<Platform>, [">= 0.4.0"])
  end
end
