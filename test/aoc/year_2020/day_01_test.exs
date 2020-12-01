defmodule Aoc.Year2020.Day01Test do
  use Aoc.DayCase
  doctest Aoc.Year2020.Day01, import: true

  alias Aoc.Year2020.Day01

  describe "part_1/1" do
    test "examples" do
      input = """
        1721
        979
        366
        299
        675
        1456
      """

      assert input |> Day01.part_1() == 514_579
    end

    @tag day: 01, year: 2020
    test "input", %{input: input} do
      assert input |> Day01.part_1() == 355_875
    end
  end

  describe "part_2/1" do
    test "examples" do
    end

    @tag day: 01, year: 2020
    test "input", %{input: input} do
      assert input |> Day01.part_2() == input
    end
  end
end
