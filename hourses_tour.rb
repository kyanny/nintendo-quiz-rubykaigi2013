require './utility'

class HoursesTour
  class Solver
    def initialize(grid)
      @grid = grid
    end

    def can_move?(x, y, j, k)
      if list_candidates_around(x, y).include?([j, k])
        return true
      end

      if list_candidates_diagonal(x, y).include?([j, k])
      end

      false
    end

    def list_candidates_around(x, y)
      candidates = []
      candidates_x = []
      candidates_x << x
      candidates_y = []
      candidates_y << y

      candidates << [x, y]

      if x > 1
        candidates_x << x-1
        if y > 1
          candidates_y << y-1
        end
      end
      candidates_x.sort!

      if x < 9
        candidates_x << x+1
        if y < 9
          candidates_y << y+1
        end
      end
      candidates_y.sort!

      candidates_x.each do |cx|
        candidates_y.each do |cy|
          candidates << [cx, cy]
        end
      end

      candidates.uniq!.sort!
    end

    def list_candidates_diagonal(x, y)
      []
    end
  end
end
