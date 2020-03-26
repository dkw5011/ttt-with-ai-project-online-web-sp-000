class Game
  require 'pry'
  attr_accessor :board, :player
  attr_writer :cells
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]
  
  def initialize(player_1 = "X", player_2 = "O")
    @player_1 = player_1
    @player_2 = player_2
end

  def board
    @board
  end
  
  def player_1
    @player
  end
  
  def player_2
    @player
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
if board[top_row_win[0]] == "X" && board[top_row_win[1]] == "X" && board[top_row_win[2]] == "X" || board[top_row_win[0]] == "O" && board[top_row_win[1]] == "O" && board[top_row_win[2]] == "O"
  WIN_COMBINATIONS[0]
 elsif board[middle_row_win[0]] == "X" && board[middle_row_win[1]] == "X" && board[middle_row_win[2]] == "X" || board[middle_row_win[0]] == "O" && board[middle_row_win[1]] == "O" && board[middle_row_win[2]] == "O"
   WIN_COMBINATIONS[1]
   
elsif board[bottom_row_win[0]] == "X" && board[bottom_row_win[1]] == "X" && board[bottom_row_win[2]] == "X" || board[bottom_row_win[0]] == "O" && board[bottom_row_win[1]] == "O" && board[bottom_row_win[2]] == "O"
    WIN_COMBINATIONS[2]
    
elsif board[left_column_win[0]] == "X" && board[left_column_win[1]] == "X" && board[left_column_win[2]] == "X" || board[left_column_win[0]] == "O" && board[left_column_win[1]] == "O" && board[left_column_win[2]] == "O"
    WIN_COMBINATIONS[5]
    
elsif board[middle_column_win[0]] == "X" && board[middle_column_win[1]] == "X" && board[middle_column_win[2]] == "X" || board[middle_column_win[0]] == "O" && board[middle_column_win[1]] == "O" && board[middle_column_win[2]] == "O"
    WIN_COMBINATIONS[6]
    
elsif self.board[right_column_win[0]] == "X" && self.board[right_column_win[1]] == "X" && self.board[right_column_win[2]] == "X" || self.board[right_column_win[0]] == "O" && self.board[right_column_win[1]] == "O" && self.board[right_column_win[2]] == "O"
    WIN_COMBINATIONS[7]

elsif board[left_diagonal_win[0]] == "X" && board[left_diagonal_win[1]] == "X" && board[left_diagonal_win[2]] == "X" || board[left_diagonal_win[0]] == "O" && board[left_diagonal_win[1]] == "O" && board[left_diagonal_win[2]] == "O"
    WIN_COMBINATIONS[3]
    
elsif board[right_diagonal_win[0]] == "X" && board[right_diagonal_win[1]] == "X" && board[right_diagonal_win[2]] == "X" || board[right_diagonal_win[0]] == "O" && board[right_diagonal_win[1]] == "O" && board[right_diagonal_win[2]] == "O"
    WIN_COMBINATIONS[4]
  end
end

def play(board)
  turn = 0
  until over? == true || turn == 9 
    turn(board)
    turn += 1
  end
  
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end


def full?
   game.board.all?{|i| i == "X" || i == "O"}
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
  board[won?(board)[0]]
else
  nil
end
end
end