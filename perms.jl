# perms("abc") -> ["abc", "acb", "bac", "bca", "cab", "cba"]
# perms("abc") -> ["abc", "bac", "bca", "acb", "cab", "cba"]
# perms("bc") -> ["bc", "cb"]
# perms("c") -> ["c"]

# interleave the head with the perms of the tail
function perms(str)
    if length(str) == 1
        return [str]
    else
        head = str[1]
        tail = str[2:end]
        output = []
        for word in perms(tail)
            output = vcat(output, interleave(head, word))
        end
        output
    end
end

function interleave(c, str)
    len = length(str)
    [str[1:i] * c * str[i+1:end] for i in 0:len]
end

