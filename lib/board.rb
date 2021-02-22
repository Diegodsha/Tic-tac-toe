class Board
    def initialize
        @board = Array.new(9, " ")
    end

    def show_board
        puts "#{@board[0] = 1} | #{@board[1] = 2} | #{@board[2] = 3}"
        puts "-----------"
        puts "#{@board[3] = 4} | #{@board[4] = 5} | #{@board[5] = 6}"
        puts "-----------"
        puts "#{@board[6] = 7} | #{@board[7] = 8} | #{@board[8] = 9}"
    end

    def player_moves(input)
    @new_board[input] = @player1
    end

    end
