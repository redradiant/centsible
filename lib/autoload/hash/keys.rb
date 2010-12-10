class Hash

  def assert_not_blank!(*mkeys)
    mkeys.each do |k|
      raise "Key #{k.to_s} is blank!" if (self[k].blank? rescue true)
    end
    true
  end

  def underscore_keys
    nh = Hash.new
    self.each_pair { |k,v| nh[k.to_s.underscore.to_sym] = v.respond_to?(:underscore_keys) ? v.underscore_keys : v }
    nh
  end

end
