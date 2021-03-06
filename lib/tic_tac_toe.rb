class TicTacToe
  def initialize
      @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

def move(index, value)
  @board[index] = value
end

def position_taken?(value)
  if @board[value] == " " || @board[value] == "" || @board[value] == nil
    false
  else
    true
  end
end

def valid_move?(index)
 if index.between?(0, 8) && !position_taken?(index)
   true
 else
   false
 end
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  value = current_player
  if valid_move?(index)
    move(index, value)
    display_board
  else
    turn
  end
end

def turn_count
   counter = 0
   @board.each do |cell|
   if cell == "X" || cell == "O"
     counter += 1
   end
 end
  counter
end

def current_player
  if turn_count.even?
    "X"
  else
    "O"
end
end

def won?
  WIN_COMBINATIONS.detect do |combo|
    @board[combo[0]] == @board[combo[1]] && @board[combo[2]] == @board[combo[1]] && position_taken?(combo[0])
  end
end

def full?
  @board.all? {|cell| cell=="X" || cell=="O"}
end

def draw?
 full? && !won?
end

def over?
  won? || draw?
end

def winner
 if won?
   index = won?[0]
   @board[index]
 end
end


def play
  until over?
    turn
  end

  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end
end 
