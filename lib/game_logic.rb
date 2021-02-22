require_relative './board.rb'
#require_relative '../bin/main.rb'
class TicTacToe
   WIN_COMBINATION = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [6, 4, 2], [0, 4, 8] ]
   attr_reader :current_player, :current_mark
   def initialize(player_one, player_two, mark_one, mark_two)
    @player_one = player_one
    @player_two = player_two
    @mark_one = mark_one
    @mark_two = mark_two
    @current_player = @player_one
    @current_mark = @mark_one
    @board = Board.new
   end

   

   # def player_moves(user_input)
   #    game_start = true 
   #    @player1_arr = []
   #    @player2_arr = [] 
   #       if @player_one 
   #          puts "Player 1 enter your move between 1 - 9"
   #          input1 = user_input 
   #          @player1_arr << input1 + 1 
   #          @board.board[input1] = @mark_one
   #          @board.show_board

   #          puts "Player 2 enter your move Between 1- 9" 
   #          input2 = user_input
   #          @player2_arr << input2 + 1
   #          @board.board[input2] = @mark_two 
   #          @board.show_board  
   #       end 
   #       p @player1_arr 
   #       p @player2_arr 
   # end 

def moves(user_input)
   @player1_arr
   if @player_one = @current_player
   @player1_arr << user_input
   @board.board[user_input]
   @board
   end
end

   def player_switch
      @current_player = @current_player == @player_one ? @player_two : @player_one
   end

   def spot_taken?

   end
   
end