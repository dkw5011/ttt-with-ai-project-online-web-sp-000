module Players
  class Human < Player
    def move(board)
      puts "Please enter your move"
      user_input = gets.strip
    end
  end
end


