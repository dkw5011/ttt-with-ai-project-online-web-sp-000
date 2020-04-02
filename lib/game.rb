class Game
  require 'pry'
  attr_accessor :board, :player_1, :player_2, :token
  
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
end

def turn
puts "Please take your turn"  
player = current_player
input = player.move(board)
if input.to_i.between?(0,8) == "false"
  turn
else
  puts "Turn: #{@board.turn_count+1}\n"
      @board.display
      @board.update(input, player)
      puts "#{player.token} moved #{input}"
      @board.display
      puts "\n\n"
end
end

def move(input)
      board.cells[input.to_i] = current_player
    end
    
def turn_count
    count = 0
    board.cells.each do |space|
      if space == "X" || space == "O"
        count += 1
      end
  end
  count
end
  
  def won?
top_row_win = [0,1,2]
middle_row_win = [3,4,5]
bottom_row_win = [6,7,8]
left_column_win = [0,3,6]
middle_column_win = [1,4,7]
right_column_win = [2,5,8]
left_diagonal_win = [0,4,8]
right_diagonal_win = [2,4,6]
if board.cells[top_row_win[0]] == "X" && board.cells[top_row_win[1]] == "X" && board.cells[top_row_win[2]] == "X" || board.cells[top_row_win[0]] == "O" && board.cells[top_row_win[1]] == "O" && board.cells[top_row_win[2]] == "O"
  WIN_COMBINATIONS[0]

  
 elsif board.cells[middle_row_win[0]] == "X" && board.cells[middle_row_win[1]] == "X" && board.cells[middle_row_win[2]] == "X" || board.cells[middle_row_win[0]] == "O" && board.cells[middle_row_win[1]] == "O" && board.cells[middle_row_win[2]] == "O"
   WIN_COMBINATIONS[1]
   
elsif board.cells[bottom_row_win[0]] == "X" && board.cells[bottom_row_win[1]] == "X" && board.cells[bottom_row_win[2]] == "X" || board.cells[bottom_row_win[0]] == "O" && board.cells[bottom_row_win[1]] == "O" && board.cells[bottom_row_win[2]] == "O"
    WIN_COMBINATIONS[2]
    
elsif board.cells[left_column_win[0]] == "X" && board.cells[left_column_win[1]] == "X" && board.cells[left_column_win[2]] == "X" || board.cells[left_column_win[0]] == "O" && board.cells[left_column_win[1]] == "O" && board.cells[left_column_win[2]] == "O"
    WIN_COMBINATIONS[5]
    
elsif board.cells[middle_column_win[0]] == "X" && board.cells[middle_column_win[1]] == "X" && board.cells[middle_column_win[2]] == "X" || board.cells[middle_column_win[0]] == "O" && board.cells[middle_column_win[1]] == "O" && board.cells[middle_column_win[2]] == "O"
    WIN_COMBINATIONS[6]
    
elsif board.cells[right_column_win[0]] == "X" && board.cells[right_column_win[1]] == "X" && board.cells[right_column_win[2]] == "X" || board.cells[right_column_win[0]] == "O" && board.cells[right_column_win[1]] == "O" && board.cells[right_column_win[2]] == "O"
    WIN_COMBINATIONS[7]

elsif board.cells[left_diagonal_win[0]] == "X" && board.cells[left_diagonal_win[1]] == "X" && board.cells[left_diagonal_win[2]] == "X" || board.cells[left_diagonal_win[0]] == "O" && board.cells[left_diagonal_win[1]] == "O" && board.cells[left_diagonal_win[2]] == "O"
    WIN_COMBINATIONS[3]
    
elsif board.cells[right_diagonal_win[0]] == "X" && board.cells[right_diagonal_win[1]] == "X" && board.cells[right_diagonal_win[2]] == "X" || board.cells[right_diagonal_win[0]] == "O" && board.cells[right_diagonal_win[1]] == "O" && board.cells[right_diagonal_win[2]] == "O"
    WIN_COMBINATIONS[4]
  end
end

def current_player
  if turn_count % 2 ==  0
   @player_1
  else 
    @player_2
  end
end


def play
  turn = 0
  until over? == true || turn == 9 
    turn
    turn += 1
  end
  
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end


def full?
   board.cells.all?{|i| i == "X" || i == "O"}
end
 
def draw?
 if full? && !won? 
   true
  else
  false
end
end

def over?
  if won? || draw? || full?
    true
  else
    false
  end
end

def winner
  if won?
  board.cells[won?[0]]
else
  nil
end
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

end