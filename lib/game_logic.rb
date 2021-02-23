class TicTacToe
  WIN_COMBINATION = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [6, 4, 2], [0, 4, 8]].freeze
  attr_reader :current_player, :current_mark, :mark_one, :mark_two, :game_finish

  def initialize(player_one, player_two, mark_one, mark_two)
    @player_one = player_one
    @player_two = player_two
    @mark_one = mark_one
    @mark_two = mark_two
    @current_player = @player_one
    @current_mark = @mark_one
    @game_finish = false
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def show_board
    %(
      #{@board[0]} | #{@board[1]} | #{@board[2]}
      ----------
      #{@board[3]} | #{@board[4]} | #{@board[5]}
      ----------
      #{@board[6]} | #{@board[7]} | #{@board[8]})
  end

  def win_check?
    WIN_COMBINATION.each do |arr_winner|
      if @board[arr_winner[0]] == @board[arr_winner[1]] && @board[arr_winner[0]] == @board[arr_winner[2]]
        @game_finish = true
      elsif draw?
        @game_finish = true
      end
    end
  end

  def draw?
    if @game_finish && @board.all? { |val| val.is_a? String }
      true
    else
      false
    end
  end

  def moves(user_input)
    @board[user_input] = @current_mark
    win_check?
  end

  def player_switch
    @current_player = @current_player == @player_one ? @player_two : @player_one
  end

  def mark_switch
    @current_mark = @current_mark == @mark_one ? @mark_two : @mark_one
  end

  def spot_taken?(user_input)
    spot = @board[user_input]
    %w[X O].include?(spot)
  end
end
