# ## S1
# # Having fun with recursion! Working on the recursive nature of the list data structure
# # This is a "map" function, because it maps one list to another list, recursively
# defmodule Class do
#     def map([], func) do
#      []
#     end
#     def map([h | t], func) do
#       [func.(h) | map(t, func)]
#     end
#
#     def add_one(list) do
#       map(list, &(&1 + 1))
#     end
#
#     def double(list) do
#       map(list, fn val -> val * 2 end)
#     end
# end
#
# IO.inspect Class.add_one [2,3,4]
# IO.inspect Class.double [2,3,4]
#
# # def double([]), do: []
# # def double([h|t]), do: [h*2 | double(t) ]
# #
# # def add_one([]), do: []
# # def add_one([h|t]), do: [h+1 | add_one(t) ]



# ## S2
# # REDUCE is supa cool!
# defmodule Class do
#
#   # general form of the reduce function, it has the list that it is decomposing/
#   # unzipping, and then the value that it is affecting at every recursive iteration
#   # and then the function that it is applying to the list
#   # def reduce(list, value, func)
#
#   def reduce([], value, _func), do: value
#   def reduce([h|t], value, func) do
#     new_value = func.(h, value)
#     IO.puts "h = #{h}, t = #{inspect t}, sum = #{value}"
#     reduce(t, new_value, func)
#   end
#
#   def sum(list) do
#     reduce(list, 0, fn element, value -> element + value end)
#   end
#
#   def len(list) do
#     reduce(list, 0, fn _element, value -> 1 + value end)
#   end
#
#   def reverse(list) do
#     reduce(list, [], &[&1|&2])
#   end
#
#   def yy(list, func) do
#     reduce(list, [], &[func.(&1) | &2]) |> reverse
#   end
# end
# IO.inspect Class.yy [1,2,3], &(&1*8)


## S3
# Filter
defmodule Class do
    def reduce([h|t], value, func) do
      new_value = func.(h, value)
      IO.puts "h = #{h}, t = #{inspect t}, sum = #{value}"
      reduce(t, new_value, func)
    end


  def filter(list, filter_fn) do
    reduce(list, [], filter_fn)
  end

  defp include_if_positive(value, result) do
    cond do
      result > 0 ->
        [value | result]
      true ->
        result
    end
  end
end
IO.inspect Class.filter([1, 4, -5, 2, -99, 0], &Class.include_if_positive/2)
