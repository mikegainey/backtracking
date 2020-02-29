# create a binary number of the given number of digits

function bin(n, number="")
    if n == 0
        print("$number ")
    else
        for digit in "01"
            bin(n-1, string(number, digit))
        end
    end
end


