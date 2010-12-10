class Float

  def decimal_only
    m = self.to_s.match(/\.(\d{0,4})/)
    return 0 if m[1].blank?
    (m[1].to_f / (10 * m[1].length.to_f)).to_f
  end

  def base_only
    self.truncate
  end
end
