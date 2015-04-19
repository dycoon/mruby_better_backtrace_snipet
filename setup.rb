
MINIRAKE = 'minirake'

unless Dir.exists? "build_tmp/mruby"
  system("git clone https://github.com/mruby/mruby.git build_tmp/mruby")
end
Dir.chdir 'build_tmp/mruby'
system("ruby #{MINIRAKE}")

Dir.chdir '../..'

puts "mruby exception backtrace"
system("build_tmp/mruby/build/host/bin/mruby exception_default.rb")
puts ""

puts "ruby exception backtrace"
system("ruby exception_default.rb")
puts ""

puts "mruby better exception backtrace"
system("build_tmp/mruby/build/host/bin/mruby exception_better_backtrace.rb")
puts ""

puts "ruby better exception backtrace"
system("ruby exception_better_backtrace.rb")
puts ""

puts "mruby fiber exception backtrace"
system("build_tmp/mruby/build/host/bin/mruby exception_fiber.rb")
puts ""

puts "ruby fiber exception backtrace"
system("ruby exception_fiber.rb")
puts ""

puts "mruby fiber better exception backtrace"
system("build_tmp/mruby/build/host/bin/mruby exception_fiber_better_backtrace.rb")
puts ""

puts "ruby fiber better exception backtrace"
system("ruby exception_fiber_better_backtrace.rb")
puts ""
