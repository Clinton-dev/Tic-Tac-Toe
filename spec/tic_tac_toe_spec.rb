#require './lib/tic_tac_toe'
require './lib/tic_tac_toe'

describe Board do
   subject{ Board.new }
   it "displays the board" do
     str = "| 0 | 1 | 2 |\n............"
     str1 ="\n| 3 | 4 | 5 |\n............"
     str2 ="\n| 6 | 7 | 8 |\n"
     board = str + str1 + str2
     expect(subject.display_board).to eq(board)
   end
end

describe Game do 
  let(:board) {Board.new}
  let(:x) {Player.create_player("X")}
  let(:o) {Player.create_player("O")}
  let(:game) {Game.new(x,o,board)}

  context "check  horizontal wins" do
    it "return true when XXX is on 1st row" do
      @board = ["#{x}","#{x}","#{x}",3,4,5,6,7,8]
      expect(game.winner?(x)).to eq(true)
    end

    it "return true when XXX is on 2nd row" do
     @board = [0,1,2,"#{x}","#{x}","#{x}",6,7,8]
     expect(game.winner?(x)).to eq(true)
   end

   it "return true when XXX is on 3rd row" do
     @board = [0,1,2,3,4,5,"#{x}","#{x}","#{x}"]
     expect(game.winner?(x)).to eq(true)
   end
  end

  context "check  vertical wins" do
    it "return true when XXX is on 1st column" do
      @board = ["#{x}",1,2,"#{x}",4,5,"#{x}",7,8]
      expect(game.winner?(x)).to eq(true)
    end

    it "return true when XXX is on 2nd column" do
     @board = [0,"#{x}",2,3,"#{x}",5,6,"#{x}",8]
     expect(game.winner?(x)).to eq(true)
   end

   it "return true when XXX is on 3rd column" do
     @board = [0,1,"#{x}",3,4,"#{x}",6,7,"#{x}"]
     expect(game.winner?(x)).to eq(true)
   end
  end

  context "check for diagonal wins" do
    it "returns true when x has diagonal left to right" do
      @board = ["#{x}",1,2,3,"#{x}",5,6,7,"#{x}"]
      expect(game.winner?(x)).to eq(true)
    end

    it "returns true when x has diagonal right to left" do
      @board = [0,1,"#{x}",3,"#{x}",5,"#{x}",7,8]
      expect(game.winner?(x)).to eq(true)
    end
  end
end