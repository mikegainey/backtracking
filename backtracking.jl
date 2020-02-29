# https://see.stanford.edu/materials/icspacs106b/H19-RecBacktrackExamples.pdf

# permute a string
function permstr(str, perm="", indent=0)
    println(" " ^ (indent*10), "($perm, $str)")
    if length(str) == 0
        println(perm)
    end

    for i in 1 : length(str)
        choice = str[i]
        others = str[1 : i-1] * str[i+1 : end]
        permstr(others, perm * choice, indent+1)
    end
end

permstr("abc")
