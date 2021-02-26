require './lib/game_logic'
require './lib/player'

describe TicTacToe do
  let(:p1) { Player.new('Eduardo', 'X') }
  let(:p2) { Player.new('Diego', 'O') }
  let(:game) { TicTacToe.new(p1, p2) }
  let(:win_combo) { game.board=["X","X","X",4,5,6,7,8,9]}
  let(:fail_combo) { game.board=["X","0","X",4,5,6,7,8,9]}
  let(:draw_combo) { game.board= %w(X O X O X O O X O) } 

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
    it 'returns false if move is not a wining move' do
      expect(game.game_finish).to eq(false)
    end
    it 'return true if move is a wining move' do
      win_combo #set the wining combo
      game.win_check? #Change game_finish to true if win_combo is wining combination
      expect(game.game_finish).to eq(true)
    end
    it 'return false if move is not a wining move' do
      fail_combo
      game.win_check?
      expect(game.game_finish).to be false
    end
  end

  describe "#draw?" do
    it "returns true if game is a draw" do
        draw_combo
        game.draw?
        expect(game.game_finish).to be true
        
    end

    it "returns false if game is a draw" do
        win_combo
        game.draw?
        expect(game.game_finish).to be false
    end
    
  end
  

 
end
