# make all combinations of words given an input string where
# V = vowel, C = consonant, N = number, [a-z] = the given letter

function words(str, word="")
    if length(str) == 0
        print("$word ")
    else
        head = str[1]
        tail = str[2:end]

        if head == 'V'
            for vowel in "aeiou"
                words(tail, string(word, vowel))
            end
        elseif head == 'C'
            for consonant in "bcdfghjklmnpqrstvwxyz"
                words(tail, string(word, consonant))
            end
        elseif head == 'N'
            for number in "0123456789"
                words(tail, string(word, number))
            end
        else
            words(tail, string(word, head))
        end
    end
end

