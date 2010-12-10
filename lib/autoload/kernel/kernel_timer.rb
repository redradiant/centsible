module Kernel
    def clock(description = "Code block timer.", &block_outer)
      require 'timeout'
      $debug.add(:debug, description, "execution_timer") do
        begin
          Timeout::timeout(5) { self.instance_eval(&block_outer) }.join
        rescue Interrupt => e
          raise("Your code took too long! #{e}")
        end
      end
    end # end timer block
end
