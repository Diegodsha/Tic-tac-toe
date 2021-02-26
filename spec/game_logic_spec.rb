require './lib/game_logic'
require './lib/player'

describe TicTacToe do
  let(:p1) { Player.new('Eduardo', 'X') }
  let(:p2) { Player.new('Diego', 'O') }
  let(:game) { TicTacToe.new(p1, p2) }

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
end
