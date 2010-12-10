class Object

  def to_id
    if self.respond_to?(:attributes) && (self[:id].present? rescue false)
      return self[:id].to_s
    elsif ((self.id.to_s rescue self.to_s) =~ /^(\d+)$/i rescue false)
      return $1
    else
      return nil
    end
  end

end
