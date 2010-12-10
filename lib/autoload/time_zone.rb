require 'active_support'
require 'tzinfo'

class Time

  module TimeZone
    def self.get(zname = "UTC")
      TZInfo::Timezone.get(TZInfo::Timezone.all_data_zone_identifiers.grep(/#{zname.to_s}/i).first).current_period_and_time().last
    end
  end

  def reload
    Time.parse(self.strftime("%Y-%m-%d %H:%M:%S %Z"))
  end

  def to_zone(zname = "UTC")
    Time.parse(TimeZone.get(zname.to_sym).to_local(self.getutc).strftime("%Y-%m-%d %H:%M:%S %Z").gsub(/ UTC/, " #{zname.to_s}"))
  end

end
