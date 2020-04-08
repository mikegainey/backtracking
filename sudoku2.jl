# An algorithm from this Numberphile video: https://youtu.be/G_UYXzGuqvM

# the input; 0 == blank cell
# board = [5 0 0 0 0 0 3 0 1;
#          0 0 0 1 0 2 0 7 0;
#          1 0 0 8 6 0 0 0 0;
#          8 5 0 0 0 0 9 0 0;
#          0 0 0 0 9 0 0 0 0;
#          0 0 4 0 0 0 0 6 7;
#          0 0 0 0 4 1 0 0 9;
#          0 8 0 7 0 6 0 0 0;
#          2 0 1 0 0 0 0 0 4
#          ]

# a hard board
board = [0 0 0 0 0 0 0 0 0;
         0 0 0 0 0 3 0 8 5;
         0 0 1 0 2 0 0 0 0;
         0 0 0 5 0 7 0 0 0;
         0 0 4 0 0 0 1 0 0;
         0 9 0 0 0 0 0 0 0;
         5 0 0 0 0 0 0 7 3;
         0 0 2 0 1 0 0 0 0;
         0 0 0 0 4 0 0 0 9
         ]

function solve()
    for row in 1:9
        for col in 1:9
            if board[row, col] == 0
                for digit in 1:9
                    if is_candidate(digit, row, col)
                        board[row, col] = digit
                        solve()
                        board[row, col] = 0
                    end
                end
                return
            end
        end
    end
    display(board)
end

# is the given digit allowed in (row, col)?
function is_candidate(digit, row, col)
    row_check = digit ∉ board[row,:]
    col_check = digit ∉ board[:,col]
    box_check = digit ∉ get_box_digits(row, col)

    row_check && col_check && box_check
end

# given a row and column, return all the digits in the box
function get_box_digits(row, col)
    if row in 1:3
        rows = 1:3
    elseif row in 4:6
        rows = 4:6
    elseif row in 7:9
        rows = 7:9
    else
        error("invalid cell.row")
    end

    if col in 1:3
        cols = 1:3
    elseif col in 4:6
        cols = 4:6
    elseif col in 7:9
        cols = 7:9
    else
        error("invalid cell.col")
    end

    board[rows, cols]
end
