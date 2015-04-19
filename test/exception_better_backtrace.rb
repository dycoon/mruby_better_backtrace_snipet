
class Exception
   
  alias_method :old_initialize, :initialize 
  alias_method :old_backtrace, :backtrace 
  
  @@initializing = false
  @@current_backtrace = nil
  
  def initialize(*args)
    old_initialize(*args)
    
    unless @@initializing
      # not thread safe
      @@initializing = true
      begin
        raise ""
      rescue => e
        @stored_backtrace = e.backtrace[2..-1]
      end
      @@initializing = false
    else
      
    end
  end
  
  def backtrace
    if @stored_backtrace
      @stored_backtrace
    else
      self.old_backtrace
    end
  end
end

def g
  raise "test"
end

def f
  begin
    g
  rescue => e
    raise e
  end
end

begin
  f
rescue => e
  puts "e.backtrace"
  puts "#{e.backtrace.map{|v| "  " + v}.join("\n")}"
end


