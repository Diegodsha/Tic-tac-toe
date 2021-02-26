require './lib/game_logic'
require './lib/player'

describe TicTacToe do
  let(:p1) { Player.new('Eduardo', 'X') }
  let(:p2) { Player.new('Diego', 'O') }
  let(:game) { TicTacToe.new(p1, p2) }
  let(:win_combo) { game.board = ['X', 'X', 'X', 4, 5, 6, 7, 8, 9] }
  let(:fail_combo) { game.board = ['X', '0', 'X', 4, 5, 6, 7, 8, 9] }
  let(:draw_combo) { game.board = %w[X O X O X O O X O] }
  let(:user_input) { 0 }

  describe '#show_board' do
    it 'Prints board grid' do
      expect(game.show_board).to eq(%(
      #{game.board[0]} | #{game.board[1]} | #{game.board[2]}
      ----------
      #{game.board[3]} | #{game.board[4]} | #{game.board[5]}
      ----------
      #{game.board[6]} | #{game.board[7]} | #{game.board[8]}))
    end
  end

  describe '#wincheck?' do
    it 'returns false if combination is not a wining combination' do
      expect(game.game_finish).to eq(false)
    end
    it 'return true if combination is a wining combination' do
      win_combo # set the wining combo
      game.win_check? # Change game_finish to true if win_combo is wining combination
      expect(game.game_finish).to eq(true)
    end
    it 'return false if combination is not a wining combination' do
      fail_combo
      game.win_check?
      expect(game.game_finish).to be false
    end
  end

  describe '#draw?' do
    it 'returns true if game is a draw' do
      draw_combo
      game.draw?
      expect(game.game_finish).to be true
    end

    it 'returns false if game is a draw' do
      win_combo
      game.draw?
      expect(game.game_finish).to be false
    end
  end

  describe '#moves' do
    it 'return the user input into the board' do
      game.moves(user_input)
      expect(game.board[0]).to eq('X')
    end
    it 'return false when the user move is not a draw' do
      expect(game.moves(user_input)).to be false
    end
    it 'game_finish is false when move is not a wining move' do
      game.moves(user_input)
      expect(game.game_finish).to be false
    end
  end

  describe '#player_switch' do
    it 'Switch player every turn' do
      expect(game.current_player).to eq(p1)
      game.player_switch
      expect(game.current_player).to eq(p2)
    end
  end

  describe 'spot_taken?' do
    it 'return true if the spot is taken on the game board' do
      game.moves(user_input)
      game.player_switch
      game.moves(user_input)
      expect(game.spot_taken?(user_input)).to be true
    end
    it 'return false if the sport is not taken on the game board' do
      game.moves(user_input) # player input token  first position
      expect(game.spot_taken?(1)).to be false
    end
  end
end
