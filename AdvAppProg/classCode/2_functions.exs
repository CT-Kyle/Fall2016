## S1
# Functions transform data; functions do not "do" something, but they transform state
# Functions are a piece of code, a value
# adder = fn (a, b) -> a + b end  # create function and bind to variable "adder"
# IO.puts adder.(4,5)
#
# swap = fn [a, b] -> [b, a] end #takes one parameter which is a list
# IO.inspect swap.([3,4])

## S2
# This below is pretty freaking awesome! We aren't doing any conditional logic,
# just writing a function that returns the proper value based on the input
# calc = fn
#   (:+, n1, n2) -> n1 + n2
#   (:*, n1, n2) -> n1 * n2
#   (:-, n1, n2) -> n1 - n2
#   (:/, n1, n2) -> n1 / n2
# end
# IO.inspect calc.(:+,4,5)
# IO.inspect calc.(:*,3,4)

# ## S3
# # Anonymous functions
# # The two functiosn below do the same thing
# &(&1 + &2)
# fn(a,b) -> a + b end
#
# at_least_10 = &(max(10, &1))
# IO.inspect at_least_10.(3)


## S4
# Modules
# "A function is defined by its name and its number of arguments"
# defmodule  Greeting do
#
#   def say_hello_to(name, state) do
#     IO.puts "Hello to #{name} in #{state}!"
#   end
#
#   def say_hello_to("Dave") do
#     IO.puts "Hello Boss!"
#   end
#
#   def say_hello_to(name) do
#     IO.puts "Hello #{name}"
#   end
#
# end
#
# Greeting.say_hello_to "Dave"

# # Modularized way of doing the calculator
# # Also notice that we are using the inline function instead of multiple line format
# defmodule Calc do
#   def eval(:+,a,b), do: a + b
#   def eval(:*,a,b), do: a * b
#   def eval(:-,a,b), do: a - b
#   def eval(:/,a,b), do: a / b
# end
# IO.inspect Calc.eval(:/, 100, 3)


# defmodule Series do
#   def fib(0), do: 0
#   def fib(1), do: 1
#   def fib(n), do: fib(n-2) + fib(n-1)
# end
#
# IO.inspect Series.fib 50

## S5
# Closures
# defmodule Greeter do
#   def greet(msg) do
#     fn(name) ->
#        IO.puts "#{msg} #{name}"
#     end
#   end
# end

# # the closure notices that name comes in from the outside world and doesn't throw
# # it away when it goes out of scope
# # This means that you can carry things around inside of functions, kinda helps when
# # you dont have objects
# # Its nice when you can setup the def with a value and then the fn with a value
# f = Greeter.greet "Hello"
# g = Greeter.greet "Howdy"
# IO.inspect f.("class")
# IO.inspect g.("dave")


## S6
# # The |> operator, called a pipe in elixir
# func1(val) |> func2 |> func3("aa") |> func4 # this or
# val |> func1 |> func2 |> func3("aa") |> func4
# # also this syntax
# val
# |> func1
# |> func2
# |> func3("aa")
# |> func4
# # This makes it very clear that val is getting transformed, this exposes that elixir
# # is about data transformation!!
# # Lesson learned: try to think of every bit of code as an expression
#
# # **** Programs are Pipelines of Transformations, each function is just a step in the
# # transformation from input to output! ****
