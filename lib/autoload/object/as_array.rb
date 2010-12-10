class Object

  def as_array
    self.kind_of?(Array) ? self : [self]
  end

end
