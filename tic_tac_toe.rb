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
  attr_reader :name,:position
  
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
 
 game = true
 
 def play
  board = Board.new
  board.display_board
  puts "you are playing as X choose position: "
  player_x = Player.create_player('X')
  player_x_choice = gets.chomp.to_i
  board.modify_board(player_x_choice,player_x.name)
  puts "you are playing as O choose position: "
  player_o = Player.create_player('o')
  player_o_choice = gets.chomp.to_i
  board.modify_board(player_o_choice,player_o.name)
 end
 
 while game
  play
  game = false
 end