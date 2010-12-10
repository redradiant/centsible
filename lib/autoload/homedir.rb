module Homedir
  def user_home_system
    user=`whoami`
    home=`echo ~`
    if user == "root\n"
      if home == "/root\n"
        puts "Hi, root!"
      else
        puts "Naughty sudoer!"
      end
    else
      puts "You can't use this script because you're not root!"
    end
  end

  def user_home_ruby
    # using ~ with no expansion produces no output
    p = "~/*"
    must { Dir.glob(p) } && return

    # using ENV["HOME"] works
    p = ENV["HOME"] + "/*"
    must { Dir.glob(p).blank? } && return

    # using Ruby's File.expand_path works too
    p = File.expand_path("~")
    must { Dir.glob(p) }
  end

  def get_homedir
    user_home_ruby || user_home_system
  end
end

