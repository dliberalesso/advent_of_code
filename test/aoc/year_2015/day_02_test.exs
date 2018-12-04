defmodule Aoc.Year2015.Day02Test do
  use Aoc.DayCase
  doctest Aoc.Year2015.Day02, import: true

  alias Aoc.Year2015.Day02

  describe "part_1/1" do
    test "examples" do
      assert Day02.part_1("2x3x4") == 58
      assert Day02.part_1("1x1x10") == 43
    end

    @tag day: 02, year: 2015
    test "input", %{input: input} do
      assert input |> Day02.part_1() == 1_588_178
    end
  end

  describe "part_2/1" do
    test "examples" do
      assert Day02.part_2("2x3x4") == 34
      assert Day02.part_2("1x1x10") == 14
    end

    @tag day: 02, year: 2015
    test "input", %{input: input} do
      assert input |> Day02.part_2() == 3_783_758
    end
  end
end
