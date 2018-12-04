defmodule Aoc.Year2018.Day02Test do
  use Aoc.DayCase
  doctest Aoc.Year2018.Day02, import: true

  alias Aoc.Year2018.Day02

  describe "part_1/1" do
    test "examples" do
      input = """
      abcdef
      bababc
      abbcde
      abcccd
      aabcdd
      abcdee
      ababab
      """

      assert Day02.part_1(input) == 12
    end

    @tag day: 02, year: 2018
    test "input", %{input: input} do
      assert input |> Day02.part_1() == 7350
    end
  end

  describe "part_2/1" do
    test "examples" do
      input = """
      abcde
      fghij
      klmno
      pqrst
      fguij
      axcye
      wvxyz
      """

      assert Day02.part_2(input) == "fgij"
    end

    @tag day: 02, year: 2018
    test "input", %{input: input} do
      assert input |> Day02.part_2() == "wmlnjevbfodamyiqpucrhsukg"
    end
  end
end
