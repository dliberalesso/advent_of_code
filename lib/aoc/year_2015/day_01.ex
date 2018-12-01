defmodule Aoc.Year2015.Day01 do
  @moduledoc """
  Solution to Day 01 of 2015: Not Quite Lisp

  ## --- Day 01: Not Quite Lisp ---

  Santa was hoping for a white Christmas, but his weather machine's "snow"
  function is powered by stars, and he's fresh out! To save Christmas, he needs
  you to collect *fifty stars* by December 25th.

  Collect stars by helping Santa solve puzzles. Two puzzles will be made available
  on each day in the advent calendar; the second puzzle is unlocked when you
  complete the first. Each puzzle grants *one star*. Good luck!

  Here's an easy puzzle to warm you up.

  Santa is trying to deliver presents in a large apartment building, but he can't
  find the right floor - the directions he got are a little confusing. He starts
  on the ground floor (floor `0`) and then follows the instructions one character
  at a time.

  An opening parenthesis, `(`, means he should go up one floor, and a closing
  parenthesis, `)`, means he should go down one floor.

  The apartment building is very tall, and the basement is very deep; he will
  never find the top or bottom floors.

  For example:

  - `(())` and `()()` both result in floor `0`.
  - `(((` and `(()(()(` both result in floor `3`.
  - `))(((((` also results in floor `3`.
  - `())` and `))(` both result in floor `-1` (the first basement level).
  - `)))` and `)())())` both result in floor `-3`.

  To *what floor* do the instructions take Santa?

  ## --- Part Two ---

  Now, given the same instructions, find the *position* of the first character
  that causes him to enter the basement (floor `-1`). The first character in the
  instructions has position `1`, the second character has position `2`, and so on.

  For example:

  - `)` causes him to enter the basement at character position `1`.
  - `()())` causes him to enter the basement at character position `5`.

  What is the *position* of the character that causes Santa to first enter the
  basement?
  """

  @doc """
  Converts the input into a `charlist` and reduces it
  """
  def part_1(input) do
    input
    |> String.to_charlist()
    |> go_to_floor()
  end

  # If the list is empty, Santa does not move!
  defp go_to_floor([]), do: 0

  # The list is not empty, let's sum or subtract 1 from the initial floor
  defp go_to_floor(list), do: reduce(list, 0)

  # 40 is the char '(', so we add 1
  defp reduce([40 | tail], acc), do: reduce(tail, acc + 1)

  # 41 is the char ')', so we subtract 1
  defp reduce([41 | tail], acc), do: reduce(tail, acc - 1)

  # Stop and return the accumulator value when the list is finally empty
  defp reduce([], acc), do: acc

  @doc """
  Converts the input into a `charlist` and reduces it until Santa
  reaches the basement for the first time
  """
  def part_2(input) do
    input
    |> String.to_charlist()
    |> position_first_basement()
  end

  # If the list is empty, we return nothing
  defp position_first_basement([]), do: nil

  # The list is not empty, let's see if Santa steps in the basement or not
  defp position_first_basement(list), do: calculate_position(list, 0, 0)

  # 40 is the char '(', so Santa moves up a floor and we increase our position tracker
  defp calculate_position([40 | tail], acc, position) do
    calculate_position(tail, acc + 1, position + 1)
  end

  # 41 is the char ')', as Santa was at the ground floor he goes to the basement
  # we stop the recursion and return the position we got plus 1
  defp calculate_position([41 | _], 0, position), do: position + 1

  # 41 is the char ')' and Santa is above the ground floor, so
  # he moves down a floor and we increase our position tracker
  defp calculate_position([41 | tail], acc, position) do
    calculate_position(tail, acc - 1, position + 1)
  end

  # If we traversed all elements of the list and
  # never get to the basement, we return nothing
  defp calculate_position([], _, _), do: nil
end
