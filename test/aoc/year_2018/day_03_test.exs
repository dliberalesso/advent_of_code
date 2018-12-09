defmodule Aoc.Year2018.Day03Test do
  use Aoc.DayCase
  doctest Aoc.Year2018.Day03, import: true

  alias Aoc.Year2018.Day03

  describe "part_1/1" do
    test "examples" do
      input = """
      #1 @ 1,3: 4x4
      #2 @ 3,1: 4x4
      #3 @ 5,5: 2x2
      """

      assert Day03.part_1(input) == 4
    end

    @tag day: 03, year: 2018
    test "input", %{input: input} do
      assert input |> Day03.part_1() == 110_546
    end
  end

  describe "part_2/1" do
    test "examples" do
      input = """
      #1 @ 1,3: 4x4
      #2 @ 3,1: 4x4
      #3 @ 5,5: 2x2
      """

      assert Day03.part_2(input) == 3
    end

    @tag day: 03, year: 2018
    test "input", %{input: input} do
      assert input |> Day03.part_2() == 819
    end
  end
end
