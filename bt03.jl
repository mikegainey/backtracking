# The farmer, fox, goose, and beans crossing the river problem

# The state is a Dict where
# - the key is a character: 'f' = farmer, 'x' = fox, 'g' = goose, 'b' = beans
# - the value is the character's location: 'l' = left shore, 'r' = right shore

state = Dict('f' => 'l',
             'x' => 'l',
             'g' => 'l',
             'b' => 'l'
             )

# the desired end state
function crossed(state)
    all(c -> state[c] == 'r', keys(state))
end

# the characters at the farmer's location
function with_farmer(state)
    [character for character in "xgb" if state[character] == state['f']]
end

# the fox will eat the goose if the farmer isn't with them
# the goose will eat the beans if the farmer isn't with them
function legal(state)
    if state['x'] == state['g'] && state['x'] ≠ state['f']
        false
    elseif state['g'] == state['b'] && state['g'] ≠ state['f']
        false
    else
        true
    end
end

function cross(state, states=[state], moves=[])
    if crossed(state)
        println(moves)
    else
        # move farmer only
        new_state = copy(state)
        new_location = state['f'] == 'l' ? 'r' : 'l'
        new_state['f'] = new_location
        if legal(new_state) && new_state ∉ states
            cross(new_state, vcat(states, new_state), vcat(moves, "f"))
        end

        # move farmer + another character
        for character in with_farmer(state)
            new_state = copy(state)
            new_state['f'] = new_location
            new_state[character] = new_location

            if legal(new_state) && new_state ∉ states
                cross(new_state, vcat(states, new_state), vcat(moves, string('f', character)))
            end
        end
    end
end
