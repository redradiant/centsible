module Kernel
  def batch_load(path, method = :require_dependency)        
    path = (path =~ /^\//) ? path : File.expand_path(path, Rails.root)
    Dir.glob(path).select { |f| !File.directory?(f) }.each do |f|
      $debug.info "Autoloading File: #{f} (#{method.to_s})", "batch_loader" do
        if `head -1 #{f}` =~ /NO\s*AUTO\s*LOAD/i
          "SKIPPED"
        else
          send(method.to_sym, f) ? "SUCCESS" : "FAILED"
          yield(f) if block_given?
        end
      end
    end
  end
end

