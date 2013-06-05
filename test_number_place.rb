require 'test/unit'
require './number_place.rb'

class TestCase_NumberPlaceSolver < Test::Unit::TestCase

  def test_list_candidates
    solver = NumberPlace::Solver.new(<<GRID.delete("\n"))
123456780
456700000
780000000
200060000
500000000
800031000
300000000
600900000
000000000
GRID
    assert_equal(Set[9],                solver.list_candidates(1, 1))
    assert_equal(Set[9],                solver.list_candidates(7, 3))
    assert_equal(Set[9],                solver.list_candidates(9, 9))
    assert_equal(Set[2, 4, 5, 6, 7, 9], solver.list_candidates(1, 6))
    assert_equal(Set[5, 8],             solver.list_candidates(6, 4))
    assert_equal(Set[2, 4, 7, 8, 9],    solver.list_candidates(5, 5))
  end


  def test_solve_0_super_easy
    solver = NumberPlace::Solver.new(<<GRID.delete("\n"))
123456789
456789123
789123456
312645978
645978312
978312645
231564897
564897000
000000000
GRID
    assert_equal(<<GRID.delete("\n"), solver.solve())
123456789
456789123
789123456
312645978
645978312
978312645
231564897
564897231
897231564
GRID
  end

  def test_solve_1_easy
    solver = NumberPlace::Solver.new(<<GRID.delete("\n"))
100050004
040609080
009000200
060000090
700000008
010000020
002000700
050806040
300010005
GRID
    assert_equal(<<GRID.delete("\n"), solver.solve())
126358974
547629183
839147256
263784591
795261438
418593627
682435719
951876342
374912865
GRID
  end

  def test_solve_2_normal
    solver = NumberPlace::Solver.new(<<GRID.delete("\n"))
100009004
800652070
000000600
760000000
090000050
010000026
004000700
050306000
300004001
GRID
    assert_equal(<<GRID.delete("\n"), solver.solve())
126739584
849652173
537418692
763245819
298163457
415897326
684921735
951376248
372584961
GRID
  end

=begin
  def test_solve_3_hard
    solver = NumberPlace::Solver.new(<<GRID.delete("\n"))
900500800
080060090
007084305
520100400
060040050
004005900
000000500
408090000
000200001
GRID
    assert_equal(<<GRID.delete("\n"), solver.solve())
943512876
285367194
617984325
529173468
761849253
834625917
172436589
458791632
396258741
GRID
  end

  def test_solve_4_super_hard
    solver = NumberPlace::Solver.new(<<GRID.delete("\n"))
600402001
080000050
003000700
000507000
450000068
000803000
006000400
020000070
300905002
GRID
    assert_equal(<<GRID.delete("\n"), solver.solve())
675482931
184739256
293156784
832567149
457291368
961843527
716328495
529614873
348975612
GRID
  end
=end

end
