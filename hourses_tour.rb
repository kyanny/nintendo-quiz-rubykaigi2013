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
        return true
      end

      false
    end

    def movable_positions(x, y)
      list_candidates_diagonal(x, y) + list_candidates_around(x, y)
    end

    def list_candidates_around(x, y)
      candidates = []
      candidates_x = []
      candidates_x << x
      candidates_y = []
      candidates_y << y

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

      candidates.delete([x, y])
      candidates
    end

    def list_candidates_diagonal(x, y)
      candidates = []
      d1 = []; d2 = []; d3 = []; d4 = []

      _x = x; _y = y
      while (_x > 1 && _y > 1)
        _x, _y = _x-1, _y-1
        d1 << [_x, _y]
      end
      d1.reverse!
      candidates += d1

      _x = x; _y = y
      while (_x < 9 && _y < 9)
        _x, _y = _x+1, _y+1
        d2 << [_x, _y]
      end
      candidates += d2

      _x = x; _y = y
      while (_x < 9 && _y > 1)
        _x, _y = _x+1, _y-1
        d3 << [_x, _y]
      end
      d3.reverse!
      candidates += d3

      _x = x; _y = y
      while (_x > 1 && _y < 9)
        _x, _y = _x-1, _y+1
        d4 << [_x, _y]
      end
      candidates += d4

      candidates.uniq
    end
  end
end
