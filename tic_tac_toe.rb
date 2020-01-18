class Board 
  def initialize
   @board = [0,1,2,3,4,5,6,7,8]
  end
  
  def display_board
   puts "|#{@board[0]} | #{@board[1]} | #{@board[2]} |\n............\n|#{@board[3]} | #{@board[4]} | #{@board[5]} |\n............\n|#{@board[6]} | #{@board[7]} | #{@board[8]} |"  
   end
  
   def modify_board(position,symbol)
     @board[position] = symbol
     display_board
   end
 end
 
 class Player
  @@draw = 0
  attr_reader :name
  
  def initialize(name)
   @name = name
  end 
 
  def self.create_player(name)
   Player.new(name)
  end
  
  def display
   "#{self.name} has #{self.win} wins and #{@@draw} :draws"
  end
 end
 
 class Game 
   def initialize(player1,player2,board)
   @player1 = player1
   @player2 = player2
   @board = board
   @current_player = @player1
  end
 
   def winner?
   #check winner
   end
   
  def change_current_player
   @current_player = (@current_player == @player1 ? @player2 : @player1)
  end
 
   def take_move
     puts " choose a position 0..8 "
     move = gets.chomp.to_i
     @board.modify_board(move,@current_player.name)
     #change_current_player
   end
 
  def play
   @board.display_board
   until winner?
     take_move
     change_current_player
   end
  end
 end
 
  player_x = Player.create_player("X")
  player_o = Player.create_player("O")
  game_board = Board.new
  game = Game.new(player_x,player_o,game_board)
  game.play
 
  
 