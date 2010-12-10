class Hash

  def compact_by_values
    present_keys = keys.collect { |k| self[k].blank? ? nil : k }.compact
    self.slice(*present_keys)
  end

  def compact_by_values!(&block)
    replace compact_by_values
  end

end
