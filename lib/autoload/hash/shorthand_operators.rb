class Hash
  def convert_to_lambda(&block)
    obj = Object.new
    obj.define_singleton_method(:_, &block)
    return obj.method(:_).to_proc
  end

  def must!(opts = {}, &block)
    block = puts(convert_to_lambda(&block).lambda?)
    (block.call? rescue nil).present? ? true : false
  end

end

