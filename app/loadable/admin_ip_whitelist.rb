require 'set'

class AdminIpWhitelist < Set
  def initialize
    @ips = Blacklist.retrieve_ips
  end
 
  def matches?(request)
    @ips.include?(request.remote_ip)
  end
end
