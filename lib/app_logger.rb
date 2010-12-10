require 'active_support/buffered_logger'
require 'term/ansicolor'

class String
  include Term::ANSIColor
end

class AppLogger < ActiveSupport::BufferedLogger

  COLORS = {
    :debug => :green,
    :info => :blue,
    :debug => :white,
    :warn => :yellow,
    :fatal => :red
  }
  
  def initialize(name)
    name = name.to_s.gsub(/[^\w\_\-\.]+/, '')
    logfile = File.expand_path("log/#{name}.log", Rails.root) rescue File.expand_path("../../log/#{name}.log", __FILE__)
    system("touch #{logfile}")
    super(logfile)
  end

  def color_name(num)
    {  0 => :debug ,
       1 => :info ,
       2 => :warn ,
       3 => :error ,
       4 => :fatal ,
       5 => :unknown }[num.to_i]
  end

  def get_severity(val)
    self.class.const_get(val.to_s.upcase.to_sym) rescue 0
  end

  def add(severity, message = nil, progname = nil, &block)
    severity = get_severity(severity) if severity.kind_of?(Symbol)
    return if @level > severity
    message = message rescue ''
    sname = color_name(severity)
    message += " ((#{progname})) " unless progname.blank?
    if block_given?
      res = block.call
      message += "BLOCK OUTPUT: #{res.to_s}"
    end

    # If a newline is necessary then create a new message ending with a newline.
    # Ensures that the original message is not mutated.
    color = (COLORS.has_key?(sname)) ? COLORS[sname] : "to_s"
    message = "[#{sname.to_s.upcase}: #{Time.now.to_s}] " + "#{message.strip}\n".send(color.to_sym)
    buffer << message
    auto_flush
    message
  end

  def capture(severity = :debug, progname = nil, &block)
    add(severity, block.call, "RESULT: ")
  end

end
