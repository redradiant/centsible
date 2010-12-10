# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rd_unobtrusive_date_picker}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Brian landau"]
  s.date = %q{2010-06-24}
  s.description = %q{Helper for creating a date or date-time picker that uses the Unobtrusive Date-Picker Widge}
  s.email = %q{}
  s.extra_rdoc_files = ["README.rdoc", "lib/12_hour_time.rb", "lib/unobtrusive_date_picker.rb", "tasks/datepicker_tasks.rake"]
  s.files = ["MIT-LICENSE", "Manifest", "README.rdoc", "Rakefile", "about.yml", "init.rb", "install.rb", "lib/12_hour_time.rb", "lib/unobtrusive_date_picker.rb", "public/images/backstripes.gif", "public/images/bg_header.jpg", "public/images/bullet1.gif", "public/images/bullet2.gif", "public/images/cal.gif", "public/images/gradient-e5e5e5-ffffff.gif", "public/javascripts/datepicker.js", "public/javascripts/lang/af.js", "public/javascripts/lang/ar.js", "public/javascripts/lang/de.js", "public/javascripts/lang/du.js", "public/javascripts/lang/en.js", "public/javascripts/lang/es.js", "public/javascripts/lang/fi.js", "public/javascripts/lang/fr.js", "public/javascripts/lang/gr.js", "public/javascripts/lang/he.js", "public/javascripts/lang/it.js", "public/javascripts/lang/nl.js", "public/javascripts/lang/no.js", "public/javascripts/lang/pt.js", "public/javascripts/lang/ro.js", "public/javascripts/lang/ru.js", "public/javascripts/lang/sp.js", "public/javascripts/lang/sv.js", "public/javascripts/lang/ua.js", "public/stylesheets/datepicker.css", "spec/date_picker_tag_spec.rb", "spec/date_picker_text_field_spec.rb", "spec/datepicker_html_class_options_spec.rb", "spec/spec.opts", "spec/spec_helper.rb", "spec/tag_matcher.rb", "spec/unobtrusive_date_picker_spec.rb", "tasks/datepicker_tasks.rake", "uninstall.rb", "unobtrusive_date_picker.gemspec"]
  s.homepage = %q{http://github.com/brianjlandau/unobtrusive_date_picker}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Unobtrusive_date_picker", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{unobtrusive_date_picker}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Helper for creating a date or date-time picker that uses the Unobtrusive Date-Picker Widge}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
