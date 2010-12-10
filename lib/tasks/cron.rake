desc "This task is called by the Heroku cron add-on"
task :cron => :environment do
 (1..30).each do |i|
   puts "Updating clock..."
   system("rdate -s rdate.cpanel.net")
   puts "done."
   sleep(5)
#   sleep(100)
  end
end
