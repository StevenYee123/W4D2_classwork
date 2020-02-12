require_relative "null_piece"

class Board 
  def initialize
    @rows = Array.new(8) { Array.new(8) }
    starting_pos
  end

  def move_piece(start_pos, end_pos)

    if valid_pos?(start_pos) && valid_pos?(end_pos)
      piece = self[start_pos]
      self[end_pos] = piece
    end
    #Our error cases: 
    #NoMethodError -> Invalid position on the board
    #Other one MIGHT have to be hardcoded??? -> Starting Position entered is nil 

    #  begin
       
    #  rescue => exception
       
    #  end

     
  end

  def starting_pos
    rows = [0, 1, 6, 7]
    rows.each do |row|
      (0..7).each do |col|
        color = "white" if row == 0 || row == 1
        color = "black" if row == 6 || row == 7
        @rows[row][col] = Piece.new(color,self,[row, col])
      end
    end
  end

  def [](pos)
    row, col = pos 
    @rows[row][col]
  end

  def []=(pos, val)
    row, col = pos 
    @rows[row][col] = val 
  end

  def valid_pos?(pos)
    rows, col = pos 
    return false if rows < 0 || rows > 7
    return false if col  < 0 || col > 7

    true
  end

  def add_piece(piece, pos)
    self[pos] = piece
  end

  private 
  def self.sentinel(null_piece)

  end

end