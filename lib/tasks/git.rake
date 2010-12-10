module GitHelpers

  def in_repo(dir = nil)
    repo ||= File.dirname(__FILE__) + '/../../'
    Dir.chdir(repo) do
      yield if block_given?
    end
  end

  def current_branch
    branch = `git branch | head -1 | awk -F' ' '{print $2}' 2>&1`.strip
    branch = 'master' if branch.blank?
    branch = "master:refs/heads/#{branch}"
  end

  def git_push
    system("git push origin #{current_branch}")
  end

  def git_pull
    system("git pull")
  end

  def git(arguments)
    command = "`which git` #{arguments}"
    `#{command}`
  end
end

namespace :git do

  extend GitHelpers

  desc "Commit, sync any local changes and then generate your commit stats report."
  task :all => [:commit, :sync, :stats]

  desc "Commits, pulls from the remote and merges if possible, then pushes to remote."
  task :up => [:commit, :sync]

  desc "Adds forking dir changes and commits changes with MESSAGE"
  task :commit => :environment do
    #system("git add .")
    #system("git commit -a #{ENV['MESSAGE'].blank? ? '' : "-m \"#{ENV['MESSAGE']}\""}")
    in_repo do
      git "add ."
      git "commit -a #{ENV['MESSAGE'].blank? ? '' : "-m \"#{ENV['MESSAGE']}\""}"
    end
  end
  
  desc "Experimental branch push.  HELP"
  task :branchup => :environment do
    in_repo do
      git_pull
      git_push
    end
  end

  desc "Fetches the remote repository and merges, then pushes local changes to remote."
  task :sync => :environment do
    in_repo do
      raise "Can not pull remote changes!" unless git_pull
      raise "Can not push local changes to remote!" unless git_push
      commits = `git log ..HEAD 2>/dev/null`.strip
      if !commits.blank?
        puts "\n##########################################################################################\n# UNPUSHED COMMITS IN YOUR REPOSITORY:\n##########################################################################################\n".magenta unless commits.blank?
        puts commits.white
        puts "\n\nTry running rake git:sync\n".orange
      else
        puts "\nYou're all synced up with the remote repository!".green
      end
    end
  end

  desc "Generate stats from git your recent commits (takes SINCE='24 hours ago')"
  task :stats => :environment do
    in_repo do
    first = ENV['START']
    since = ENV['SINCE'] || "24 hours ago"
    last = ENV['END'] || 'HEAD'
    author = ENV['AUTHOR'] || `git config --global -l | grep user\.email | awk -F'=' '{ print $2 }' 2>&1`.strip
    author_name = author.match(/^([^\@]+)\@/)[1] rescue author
    puts "\n##########################################################################################\n# Generating git stats for #{author}:\n##########################################################################################\n\n".magenta

    last_commit = `git show #{last} --show-notes | egrep "^commit" | awk -F' ' '{ print $2 }'`.strip
    first_commit = !since.blank? ? `git log #{last_commit} --since='#{since}' --pretty=format:'[%cn :: %cr] %s => %H' --author='#{author}' | tail -1 | awk -F'=> ' '{ print $2 }' 2>&1`.strip :
      `git show #{first} --show-notes | egrep "^commit" | awk -F' ' '{ print $2 }'`.strip
    first_commit = "master" if first_commit.blank?
    outfile = ENV['OUT'] || File.dirname(__FILE__) + "/../../public/gitstats-#{author_name}"

    raise "Start and end commits are both: #{first_commit}" if first_commit == last_commit

    File.open("#{outfile}.diff", 'w') { |f| f.write "##########################################################################################\n# Showing commits from #{author} since #{since}:\n##########################################################################################\n".magenta }
    system("git log #{first_commit}..#{last_commit} --pretty=format:'[%Cgreen%cn%Creset :: %Cred%cr%Creset] %s => %Cblue%H%Creset' --author='#{author}' 2>&1 >>  #{outfile}.diff")
    File.open("#{outfile}.diff", 'a') { |f| f.write "\n##########################################################################################\n# UPDATED FILES:\n##########################################################################################\n".magenta }

    diff = "git diff --stat #{first_commit} #{last_commit} --pretty=format:fuller --color-words --find-copies-harder -M90% --diff-filter='ACMT' -b --committer=#{author} --format=fuller --cumulative --word-diff=porcelain --standard-notes 2>&1 >> #{outfile}.diff"
    system(diff)
    system("script/ansi2html #{outfile}.diff > #{outfile}.html")
    puts "Report generated and saved to: http://#{Rails.configuration.action_dispatch.default_url_options[:host]}/gitstats-#{author_name}.html".green
    end
  end


end
