# Given a list of numbers and a target number, return (or print) a
# subset of the numbers that sum to the target

function subsetsum(loi, target, subset=[], results=Set())
    if length(loi) == 0
        if length(subset) > 0 && sum(subset) == target
            push!(results, subset)
        else
            return
        end

    else
        head = loi[1]
        tail = loi[2:end]

        subsetsum(tail, target, vcat(subset, head), results)
        subsetsum(tail, target, subset, results)
    end
    results
end

