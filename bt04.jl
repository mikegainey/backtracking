# Towers

state = ([1,2,3], [], []) # left to right = top to bottom

function towers(state, states=[state], moves=[])
    @show state
    @show states
    readline()
    if state[3] == [3,2,1]
        println(moves)
    else
        for move in [(1,2), (1,3), (2,1), (2,3), (3,1), (3,2)]
            new_state = deepcopy(state)
            moveit!(new_state, move)
            if legal(new_state) && new_state ∉ states
                towers(new_state, vcat(states, new_state), vcat(moves, move))
            end
        end
    end
end

function moveit!(state, move)
    from = move[1]
    to = move[2]
    if length(state[from]) == 0
        return
    else
        disk = popfirst!(state[from])
        pushfirst!(state[to], disk)
    end
end

function legal(state)
    issorted(state[1])  && issorted(state[2])  && issorted(state[3])
end

# states doesn't work
