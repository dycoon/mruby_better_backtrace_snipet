# mruby_better_backtrace_snipet
mruby better backtrace snipet

When this code run on mruby,

```ruby
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

```

you get following.

```
e.backtrace
  exception_default.rb:18

```

if you add code from exception_better_backtrace_snipet.rb

you get following

```
e.backtrace
  exception_better_backtrace.rb:37:in Object.g
  exception_better_backtrace.rb:42:in Object.f
  exception_better_backtrace.rb:49
```

I prfefer this.

# run　test

```
# cd test
# ruby setup.rb

... build ruby ...

mruby exception backtrace
e.backtrace
  exception_default.rb:18

ruby exception backtrace
e.backtrace
  exception_default.rb:3:in `g'
  exception_default.rb:8:in `f'
  exception_default.rb:15:in `<main>'

mruby better exception backtrace
e.backtrace
  exception_better_backtrace.rb:37:in Object.g
  exception_better_backtrace.rb:42:in Object.f
  exception_better_backtrace.rb:49

ruby better exception backtrace
e.backtrace
  exception_better_backtrace.rb:37:in `raise'
  exception_better_backtrace.rb:37:in `g'
  exception_better_backtrace.rb:42:in `f'
  exception_better_backtrace.rb:49:in `<main>'

mruby fiber exception backtrace
e.backtrace
  exception_fiber.rb:19

ruby fiber exception backtrace
e.backtrace
  exception_fiber.rb:6:in `block in f'

mruby fiber better exception backtrace
e.backtrace
  exception_fiber_better_backtrace.rb:40

ruby fiber better exception backtrace
e.backtrace
  exception_fiber_better_backtrace.rb:40:in `raise'
  exception_fiber_better_backtrace.rb:40:in `block in f'

```
