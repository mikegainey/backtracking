#= julia> parts("abc")
(left, right) = ("abc", "")
(left, right) = ("ab", "c")
(left, right) = ("ac", "b")
(left, right) = ("a", "bc")
(left, right) = ("bc", "a")
(left, right) = ("b", "ac")
(left, right) = ("c", "ab")
(left, right) = ("", "abc")
=#

function parts(list :: String, left="", right="")
    if length(list) == 0
        @show left, right
    else
        head = list[1]
        tail = list[2:end]
        parts(tail, left * head, right)
        parts(tail, left, right * head)
        nothing
    end
end



