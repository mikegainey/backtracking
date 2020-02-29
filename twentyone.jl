# https://stackoverflow.com/questions/41871357/python-return-statement-during-backtracking
# I don't know why this works!

function twentyone(nums, stack=(), answers=Set())
    @show nums, stack, answers
    for (index, num) in enumerate(nums)
        new_stack = tuple(stack..., num)
        total = sum(new_stack)
        if total == 21
            push!(answers, new_stack)
        elseif total < 21
            twentyone(nums[index + 1:end], new_stack, answers)
        end
    end
    answers
end

input = [1,9,11,5,6,3,7]
twentyone(input)
