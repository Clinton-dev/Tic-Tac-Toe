class Board 
  attr_reader :board
   def initialize
    @board = [0,1,2,3,4,5,6,7,8]
   end
  
   def display_board
    <<~BOARD
    | #{@board[0]} | #{@board[1]} | #{@board[2]} |
    ............
    | #{@board[3]} | #{@board[4]} | #{@board[5]} |
    ............
    | #{@board[6]} | #{@board[7]} | #{@board[8]} |
    BOARD
  end
   
    def modify_board(position,symbol)
      @board[position] = symbol
      #commented for testing =>display_board
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
    @win = false
    @current_player = @player1
   end
  
     WIN_COMBO = [
      [0, 1, 2], # horizontals
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6], # verticals
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8], # diagonals
      [2, 4, 6]
    ]
  
    def winner?(player)
     WIN_COMBO.any? do |combo|
       combo.all? {|position| @board.board[position] == player.name}
       @win = true
     end
    end
    
   def change_current_player
    @current_player = (@current_player == @player1 ? @player2 : @player1)
   end
  
    def take_move
      puts " choose a position 0..8 "
      move = gets.chomp.to_i
      puts @board.modify_board(move,@current_player.name)
    end
  
=begin
   def play
    puts @board.display_board
    9.downto(0) do
      take_move
      return "#{@current_player.name} won!!"  if winner?(@current_player)
      change_current_player
    end
   end
=end
  end

=begin
   player_x = Player.create_player("X")
   player_o = Player.create_player("O")
   game_board = Board.new
   game = Game.new(player_x,player_o,game_board)
   game.play
=end
   
  