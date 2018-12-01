defmodule Aoc.Year2015.Day01Test do
  use Aoc.DayCase
  doctest Aoc.Year2015.Day01, import: true

  alias Aoc.Year2015.Day01

  describe "part_1/1" do
    test "special case" do
      assert Day01.part_1("") == 0
    end

    test "regular cases" do
      assert Day01.part_1("(())") == 0
      assert Day01.part_1("()()") == 0
      assert Day01.part_1("(((") == 3
      assert Day01.part_1("(()(()(") == 3
      assert Day01.part_1("))(((((") == 3
      assert Day01.part_1("())") == -1
      assert Day01.part_1("))(") == -1
      assert Day01.part_1(")))") == -3
      assert Day01.part_1(")())())") == -3
    end

    @tag day: 01, year: 2015
    test "input", %{input: input} do
      assert input |> Day01.part_1() == 280
    end
  end

  describe "part_2/1" do
    test "special case" do
      assert Day01.part_2("") == nil
    end

    test "regular cases" do
      assert Day01.part_2(")") == 1
      assert Day01.part_2("()())") == 5
    end

    @tag day: 01, year: 2015
    test "input", %{input: input} do
      assert input |> Day01.part_2() == 1797
    end
  end
end
