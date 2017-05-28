=begin
    file:   board.rb
    create: 28.05.2017
    class:  Board
    methods:   1. initialize
               2. [](row, col)
               3. []=(row, col, marker)
               4. to_s
               5. intersecting_lines(r1, c1)
               6. covered?
               7. left_diagonal
               8. right_diagonal
               9. row (index)
               10. column(index)
=end

module TicTacToe
  #definirea clasei Board
  class Board
    InvalidRequest = Class.new(StandardError)
    #Constante
    LEFT_DIAGONAL_POSITIONS  = [[0,0],[1,1],[2,2]]
    RIGHT_DIAGONAL_POSITIONS = [[2,0],[1,1],[0,2]]
    SPAN                     = (0..2)
    CELL_COUNT               = 9
    # 1. Metoda constructor
    def initialize
        #Variabile de instanta @data, @last_move
      @data = Array.new(3){Array.new(3)}
=begin
      @data = [[nil,nil,nil],
               [nil,nil,nil],
               [nil,nil,nil]]
=end
      @last_move = nil
    end
    #Share instance variable - citeste variabila last_move
    attr_reader :last_move
    #2.Metoda [](row, col)
    def [](row, col)
=begin
    Tries to return the element at position index, but throws an IndexError exception if the        referenced index lies outside of the array bounds. This error can be prevented by supplying a second   argument, which will act as a default value.
=end
      @data.fetch(row).fetch(col)
    rescue IndexError
      raise InvalidRequest, "Position is not within the grid"
    end
    #3.Metoda []=(row, col, marker)
    def []=(row, col, marker)
      if self[row, col]
        raise InvalidRequest, "Position is already occupied"
      end

      @data[row][col] = marker
      @last_move     = [row,col]
    end
    #4.Methoda to_s 
    def to_s
      @data.map { |row| row.map { |e| e || " " }.join("|") }.join("\n")
    end

    def intersecting_lines(r1, c1)
      [left_diagonal, right_diagonal, row(r1), column(c1)]
    end

    def covered?
      @data.flatten.compact.length == CELL_COUNT
    end

    def left_diagonal
      LEFT_DIAGONAL_POSITIONS.map { |e| self[*e] }
    end

    def right_diagonal
      RIGHT_DIAGONAL_POSITIONS.map { |e| self[*e] }
    end

    def row(index)
      SPAN.map { |column| self[index, column] }
    end
    
    def column(index)
      SPAN.map { |row| self[row, index] }
    end
  end
end
