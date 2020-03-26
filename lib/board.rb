class Board
  require 'pry'
  attr_accessor :cells, :token, :game
  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

  end
  
  def reset!
    @cells.clear
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
    
    def display
  puts  " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
  puts  "-----------"
  puts  " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
  puts  "-----------"
  puts  " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
end

def position(user_input)
 @cells[user_input.to_i - 1]
end

def full?
  @cells.all?{|i| i == "X" || i == "O"}
end
 
 def taken?(location)
  if  @cells[location.to_i-1] == " " || @cells[location.to_i-1] == ""
    false
  else
    true
  end
end

def valid_move?(index)
  if index.to_i.between?(1,9) && !taken?(index.to_i)
    true
  else
    false
  end
end

def turn_count
    count = 0
    @cells.each do |space|
      if space == "X" || space == "O"
        count += 1
      end
  end
  count
end

def update(index, player)
  @cells[index.to_i-1] = player.token
end

end
