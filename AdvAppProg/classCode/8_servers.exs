# SERVERS and STEARF
## S1 -  tail call elimination
# Tail call elimination is freaking amazing!! AHH!!
# Basically, if the last operation is for the function to call itsellf,
# then the function will loop back up to the top and run again, updating
# state.
# In this way we are not shoving a whole bunch of crap onto the stack, but
# are conserving resources in the recursion (the code is literally
# executing a 'goto' in machine code).
def func(state) do
  #blah blah blah
  func(state + 1) # tail call elimination
end

defmodule M do
  def oa(location) do
    receive
    #...
    #...
    location = %{ location | person => :in_building }
    send reply
    oa(location)
  end
end
spawn M, :oa, [ %{} ]

# ^^^ This process is so so mainline that it is everywhere in Erland and
# Elixir

# The future of software is to design our applications as 100's of little
# small services. A FEDERATION of little actors performing on your data!
# We are coding for the future! For skynet! For IoT! We are making lots
# of microservices!


## S2 Server implementation
# There is only one set of the code, and even with mutiple processes,
# the processes are really just state, not sets of code. So when you
# swtich to a new process, you are really just doing a context switch
# to a new state.

# Code on the right hand side runs on the server process
# code on the left runs on the client side
# This is beautiful! Because under the hood, we are writing functional
# code, but on the surface, we can still do OOP




















# ___
