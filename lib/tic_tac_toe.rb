class TicTacToe
  
    WIN_COMBINATIONS = [
    [0, 1, 2], #top row
    [3, 4, 5], #middle row
    [6, 7, 8], #bottom row
    [0, 3, 6], #1 coluna
    [1, 4, 7], #2 coluna
    [2, 5, 8], #3 coluna
    [0, 4, 8], #1 diagonal
    [2, 4, 6] #2 diagonal
    ]
    
    def initialize(board = nil)
      @board = board || Array.new(9, " ")
    end
   
    def current_player
      turn_count % 2 == 0 ? "X" : "O"
    end
   
    def turn_count
      @board.count{|token| token == "X" || token == "O"}
    end
   
    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    
    def input_to_index(choice)
      index = choice.to_i - 1  
    end
    def move(index, cp)
      @board[index] = cp
    end
    def position_taken?(index)
      if @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
      else
      return true
      end
    end
    def valid_move?(index)
      if (0..8).to_a.include?(index) && !position_taken?(index)
        true
      end
    end
    def turn
     puts "Please enter 1-9:"
     choice = gets.strip
     index = input_to_index(choice)
     if valid_move?(index) == true
       move(index, current_player)
       display_board
       else
       turn
     end
    end
    def won?
      WIN_COMBINATIONS.each do |win_combo|
      
      position_1 = @board[win_combo[0]]
      position_2 = @board[win_combo[1]]
      position_3 = @board[win_combo[2]]
  
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combo
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combo
      end
    end
    return false
    end
    def full?
      if @board.any?(" ")
      false
      else
      true
      end
    end
    def draw?
      if full? && !won?
        true
      else
        false
      end
    end
    def over?
      if full? || won?
        true
      else
        false
      end
    end
    def winner
     if won?
       @board[won?[0]].include?("X") ? "X" : "O"
     end
    end
    
    def play
      display_board
      while !over?
        turn
      end
      won? ? puts("Congratulations #{winner}!") : puts("Cat's Game!")
    end
  end