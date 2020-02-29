# Mike Gainey's Sudoku Solver in Julia (21 Feb 2020)

# the input; 0 == blank cell
board = [5 0 0 0 0 0 3 0 1;
         0 0 0 1 0 2 0 7 0;
         1 0 0 8 6 0 0 0 0;
         8 5 0 0 0 0 9 0 0;
         0 0 0 0 9 0 0 0 0;
         0 0 4 0 0 0 0 6 7;
         0 0 0 0 4 1 0 0 9;
         0 8 0 7 0 6 0 0 0;
         2 0 1 0 0 0 0 0 4
         ]

# given an unsolved board, print the solved board
function solve(board, cell=(row=1,col=1))
    if cell == "board complete"
        display(board)
    elseif board[cell.row, cell.col] != 0 # ... is not blank
        # the cell digit is given -- just go to the next cell
        solve(board, next_cell(cell))
    else
        # recursive calls using each candidate digit
        for digit in candidates(board, cell)
            solve(next_board(board, cell, digit), next_cell(cell))
        end
    end
end


##### helper functions #####

# given a cell return the next cell (moving left to right, top to bottom)
function next_cell(cell)
    if cell.col < 9
        (row=cell.row, col=cell.col + 1)
    elseif cell.row < 9
        (row=cell.row + 1, col=1)
    else
        "board complete"
    end
end

# given a board, cell, and a digit,
# return a new board with the digit in the given cell
function next_board(board, cell, digit)
    next_board = copy(board)
    next_board[cell.row, cell.col] = digit
    next_board
end

# given a board and cell,
# return the candidate digits that can go in the cell
function candidates(board, cell)
    col_digits = board[:, cell.col]
    row_digits = board[cell.row, :]
    box_digits = get_box_digits(board, cell)

    # the digits in the row, column, or box
    not_candidates = Set()
    not_candidates = union(not_candidates, col_digits)
    not_candidates = union(not_candidates, row_digits)
    not_candidates = union(not_candidates, box_digits)

    setdiff(1:9, not_candidates) # 1 through 9, minus the "not candidates"
end

# a helper function for candidates
# given a board and cell, return all the digits in the box
function get_box_digits(board, cell)
    if cell.row in 1:3
        rows = 1:3
    elseif cell.row in 4:6
        rows = 4:6
    elseif cell.row in 7:9
        rows = 7:9
    else
        error("invalid cell.row")
    end

    if cell.col in 1:3
        cols = 1:3
    elseif cell.col in 4:6
        cols = 4:6
    elseif cell.col in 7:9
        cols = 7:9
    else
        error("invalid cell.col")
    end

    board[rows, cols]
end

