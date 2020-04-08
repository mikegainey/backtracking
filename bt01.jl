# add 0 or 1 to a string (number) until a certain length is reached

function make_number(n, number="")
    if length(number) == n
        return [number]
    else
        r1 = make_number(n, string(number, "r"))
        r2 = make_number(n, string(number, "l"))
        r3 = make_number(n, string(number, "u"))
        r4 = make_number(n, string(number, "d"))
        results = vcat(r1, r2, r3, r4)
    end
    results
end
