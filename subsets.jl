# subsets("abc") -> ["", "a", "b", "c", "ab", "ac", "bc", "abc"]
function subsets(str)
    if length(str) == 0
        return ""
    else
        head = str[1]
        tail = str[2:end]
        withhead = head * subsets(tail)
        nohead = subsets(tail)
