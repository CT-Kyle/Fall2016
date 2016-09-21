# ## S1
# # Guard clauses
# defmodule Demo do
#     def order({a,b}) when a < b, do: {a,b}
#     def order({a,b}),            do: {b,a}
# end
#
# IO.inspect Demo.order {1,2} # => {1,2}
# IO.inspect Demo.order {86,3} # => {1,2}

# ## S2
# # Maps
# state_name = %{ "TX" => "Texas", "MD" => "Maryland"}
# IO.inspect state_name["TX"] #comes out ordered weirdly, maps don't hold sorting
# %{ :name => "Dave", :state => "TX", :age => 24}
# me = %{ name: "Dave", state: "TX", age: 24}  #This is an alternate syntax for using atoms
#
# IO.inspect me.name # use this if all keys of the map are atoms
# # OR
# IO.inspect me[:name]
#
# %{name: my_name, state: "TX"} = me
# # IO.inspect my_name
#
#
# # greet = fn
# #   %{ name: name, state: "TX"} -> "Howdy #{name}"
# #   %{ name: name }             -> "Hello #{name}"
# # end
# # greet.me
#
# field = :name
# %{ ^field => name } = me
# IO.inspect name
#
# ### Usefule map functions
# # delete
# # fetch get
# # get_and_update
# # keys
# # new
# # put
# # take
# # to_list
# # update
# # values
# ###

# ## S3
# # Nested maps
# person = %{
#   name: %{
#     first: "Joe",
#     last: "Valim"
#   },
#   address: %{
#     country: "Poland"
#   }
# }
# # This used to be the only way to update a nested map
# %{ person | name: %{person.name | first: "Jose"} }
# IO.inspect %{ person | name: %{person.name | first: "Jose"} }
# # person.name.first = "Jose" #this wont work in elixir
#
# update = put_in(person.name.first, "Fred")
# IO.inspect update
#
# # also this format
# update2 = put_in(person, [:name, :first], "Wilma")
# IO.inspect update2

# ## S3 extra
# car = %{
#   manufacturer: "Ford",
#   model_year: "1999",
#   color: %{
#     body: "green",
#     trim: "red"
#   }
# }
# IO.inspect car.color.trim
#
# numbers = %{ 1 => "one", 2 => "two", 3 => "three"}


# ## S4
# # Structs - a more formal map
# defmodule Car do
#     defstruct(manufacturer: "",
#               year: 2016,
#               color: %{
#                 body: "white",
#                 trim: "greeen"
#               })
# end
#
# defmodule D do
#   c = %Car{  manufacturer: "Ford", year: 1957}
#   c1 = %Car{ c | year: 2010}
#   # OR
#   c1 = put_in c.year, 2007
#   IO.puts "#{c1.year} #{c.manufacturer}"
# end


## S5
# MapSet - cross between a map and a set, a map with set functions


## S6
# Keywords
IO.inspect "Hello", pretty: true, width: 40
# OR
IO.inspect("Hello", [pretty: true, width: 40])
# The second syntax makes it clear that there is a keywords list
# acess using [:key] syntax
# do not use these unless you just have a few items, because it is a tuple/list
# implementation and is much slower, it has O(n) look up time because it has to
# traverse the list to find the correct value for the key
