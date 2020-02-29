# permvowel("m") -> ["m"]
# permvowel("ma") -> ["ma", "me", "mi", "mo", "mu"]

# this sort-of works!
function permvowel(str, output=[])
    vowels = "aeiou"
    if length(str) == 1
        if length(output) == 0
            if str[1] ∈ vowels
                return [letter for letter in vowels]
            else
                return [str[1]]
            end
        else # length(output) > 0
            if str[1] ∈ vowels
                return [word * letter for word in output, letter in "aeiou"]
            else
                return [word * str[1] for word in output]
            end
        end
    else
        permvowel(str[end], permvowel(str[1:end-1]))
    end
end

# no worky
function permv2(str)
    vowels = "aeiou"
    if length(str) == 0
        return []
    end

    head = str[1]
    tail = str[2:end]

    if head ∈ vowels
        return vcat([letter * word for letter in vowels, word in permv2(tail)]...)
    else
        return vcat([head * word for word in permv2(tail)]...)
    end
end
