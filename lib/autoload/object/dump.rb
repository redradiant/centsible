class Object
  def debug_dump(ident = nil)
    if $debug
      msg = "\n===========================================================================\n".cyan
      msg += "   ----> DUMPING VARIABLE: ".green + (ident.nil? ? '' : "[[NAME: #{ident.to_s.yellow}]]")
      msg += self.class.to_s.red + " ID ".green + self.object_id.to_s.magenta + ":\n\n".green
      msg += self.pretty_inspect.white
      msg += "===========================================================================\n".cyan
      $debug.debug(msg)
    end
  end
end
