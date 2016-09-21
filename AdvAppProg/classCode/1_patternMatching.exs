# Code notes on pattern matching
# S1
#[a, a] = [1, 1]
#a = "#inspect(a)"
#IO.puts and rest and |
# [h | rest] gives you the head of the list and the rest of the list
# h gives you a copy of the first element in the list, rest gives a pointer to the
# second part of the list and therefore the rest of the list

# S2
# You can change the value of the binding, but you cannot change the value itself
# The equals is not an assignment operator, like in C, but is a binder. The data is
# never mutated.
#a = 1
#a = 2
#IO.inspect a

# S3
# "^" is the pin operator, what does it do?
#a = 4
#[^a, b] = [4, 5]
#IO.inspect a
#IO.inspect b


# S4
# the "_" operator; says that date and time are irellevant, and to not bind them
# its good practice to leave the underscores in
# [ _date, _time, temperature] = [1,2,3]
# IO.puts temperature


# S5
# [a, a | rest ] = [1,1,2,3,5,8]
