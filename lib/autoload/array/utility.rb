class Array

  def to_proc
     Proc.new { |*args| args.shift.__send__(self.first, *(args + self[1..-1])) }
  end

  def equal_by_key?(*args)
    key = args.first.kind_of?(Symbol) ? args.unshift : :id
    key = key.to_sym
    array = *args
    self.map(&key).sort.map(&:to_s) == array.map(&key).sort.map(&:to_s)
  end


end
