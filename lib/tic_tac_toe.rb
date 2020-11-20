class TicTacToe

    WIN_COMBINATIONS = [
        [0, 1, 2], #Top Row
        [3, 4, 5], #Middle Row
        [6, 7, 8], #Bottom Row
        [0, 3, 6], #Left Column
        [1, 4, 7], #Middle Column
        [2, 5, 8], #Right Column
        [0, 4, 8], #Backward Slash
        [2, 4, 6] #Forward Slash
    ]

    def initialize
        @board = Array.new(9, " ")
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def move(index, token = "X")
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] != " "
    end

    def valid_move?(index)
        (0..8).member?(index) && position_taken?(index) == false
    end

    def turn_count
        @board.join.count("XO")
    end

    def current_player
        turn_count.even? ? "X" : "O"
    end

    def turn
        puts "Please enter a number (1-9):"
        input = gets.strip
        index = input_to_index(input)
        if valid_move?(index)
          move(index, current_player)
        else
          turn
        end
        display_board
    end


    def won?
        WIN_COMBINATIONS.detect do |win_combo|
            position_taken?(win_combo[0]) && @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[1]] == @board[win_combo[2]]
        end
    end

    def full?
        @board.none? do |box|
            box == " "
        end
    end

    def draw?
        full? && !won?
    end

    def over?
        won? || draw?
    end

    def winner
        if won?
            win_combo = won? 
            @board[win_combo[0]]
        else 
            nil
        end
    end

    def play
        turn until over?
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end
end


