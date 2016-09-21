# Concurrency is a programmatic construct. The lifetimes of the execution overlap
# Parallel is a hardware construct
# Shared state can give us buuuuugs! So need to eliminate shared state!

## Elixir uses the Actor Model!!
# - Actor is a process
# - processes have a unique ID (pid). Current process's ID is accessible using self()
# - every processor has a mailbox
# - use send to add a message to a process's mailbox
# - process explicitly reads a message from the mailbox using receive

## How to create a process
1...10 |> Enum.map(&(spawn(fn -> IO.puts &1 end))

## sending a message
# flush will pop all of the messages out of the mailbox
send self, "Hello World" #sends a message to your mailbox
Process.info(self)[:messages] #prints the mailbox

send self, { :info, "Lunch is ready"}
send self, {:urgent, "We're out of peanut butter"}

# This will loop through the mailbox and then loop through the cond cases, so if
# an "other" is first, then it will get popped off and printed
receive do
  {:urgent, text} -> IO.puts "OH NO! #{text}"
  { other, text}  -> IO.puts "less important #{text}"
end



## Receive a message
receive do
  msg -> IO.puts "You said #{msg}"
end



## Signals
# Signals are just messages, except that they are nromally handled by the runtime
# before they appear in a processes mailbox

# when you exit with a reason it will really kill the process
exit(:reason) #and
exit()
Process.flag(:trap_exit, true) # this will have the exit handled by the code, not by
# the runtime, so it can handle the exit


## Monitoring
# you can monitor things
# you can explicitlly handle process failures
# you explicitly decide what happens next
# one way
# many processes can monitor a process
 pid = spawn fn -> :timer.sleep 10000 end
 Process.monitor(pid)
 Process.info(self)[:messages]


 ## Linking
 # spawn_link is how you connect to processes so that they die together
 # intertwines the fates of two processes
 # if A is linked to B, then they are also linked the other direction as well
 pid = spawn_link fn -> :timer.sleep 3000; exit{:boom} end

 #also a spawn_monitor option that monitors a spawn


 ## Processes
 # - are cheap (unlike OS processes)
 # - are isolated
 # - have a single message queue, the mailbox
 # - read from mailbox using pattern matching
 # - can be monitored and/or linked to handle failures
