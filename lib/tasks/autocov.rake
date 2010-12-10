require 'rcov/rcovtask'
require "rspec/core/rake_task"

%w(models controllers helpers requests routing views views all).each do |dir| 
  namespace :auto do
    namespace :rcov do
      #ENV['RAILS_ENV'] = 'test'
      #RAILS_ENV = "test"
      #Rails.env = "test"

      desc "Run RCov specs on a group of specs."
      RSpec::Core::RakeTask.new("#{dir.to_s}".to_sym => ["db:test:prepare"]) do |t|
        t.rcov = true
        t.pattern = "spec/#{dir.to_s == "all" ? '**' : dir.to_s}/*_spec.rb"
        t.spec_opts = ['--color']
        #t.rcov_opts = ['--exclude', '/gems/']
        t.rcov_opts = [ %Q{-o "#{Rails.root.to_s}/public/coverage/#{dir.to_s}"} ]
        t.rcov_opts << IO.readlines("#{Rails.root.to_s}/spec/rcov.opts").map {|l| l.chomp.split " "}
        t.rcov_opts = t.rcov_opts.flatten!
      end
    end

    desc "Run it with prereqs"
    task :"#{dir.to_s}".to_sym do
      Rake::Task["db:test:purge"].invoke
      system("cd #{Rails.root.to_s} && rake db:migrate RAILS_ENV='test'")
      Rake::Task["auto:rcov:#{dir.to_s}"].invoke
    end
  end
end
