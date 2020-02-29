# print the perms
function perms1(cs, output="")
    if length(cs) == 0
        print(output, " ")
    else
        tail = cs[2:end]
        for x in 1 : length(cs)
            chosen = cs[x]
            other = cs[1:x-1] * cs[x+1:end]
            perms1(other, output * chosen)
        end
    end
end

# return a list of the perms
function perms2(cs)
    if length(cs) == 1
        return [cs]
    else
        head = cs[1]
        tail = cs[2:end]
        output = []
        for word in perms2(tail)
            for pos in 0 : length(word)
                perm = word[1:pos] * head * word[pos+1:end]
                push!(output, perm)
            end
        end
        return output
    end
end
