defmodule Aoc.Year2020.Day01 do
  @moduledoc """
  Solution to Day 01 of 2020: Report Repair

  ## --- Day 1: Report Repair ---

  After saving Christmas five years in a row, you've decided to take a vacation at
  a nice resort on a tropical island. Surely, Christmas will go on without you.

  The tropical island has its own currency and is entirely cash-only. The gold
  coins used there have a little picture of a starfish; the locals just call them
  *stars*. None of the currency exchanges seem to have heard of them, but somehow,
  you'll need to find fifty of these coins by the time you arrive so you can pay
  the deposit on your room.

  To save your vacation, you need to get all *fifty stars* by December 25th.

  Collect stars by solving puzzles. Two puzzles will be made available on each day
  in the Advent calendar; the second puzzle is unlocked when you complete the
  first. Each puzzle grants *one star*. Good luck!

  Before you leave, the Elves in accounting just need you to fix your *expense
  report* (your puzzle input); apparently, something isn't quite adding up.

  Specifically, they need you to *find the two entries that sum to `2020`* and
  then multiply those two numbers together.

  For example, suppose your expense report contained the following:

  `1721
  979
  366
  299
  675
  1456
  `In this list, the two entries that sum to `2020` are `1721` and `299`.
  Multiplying them together produces `1721 * 299 = 514579`, so the correct answer
  is `*514579*`.

  Of course, your expense report is much larger. *Find the two entries that sum to
  `2020`; what do you get if you multiply them together?*


  """

  @doc """
  Return the product of the two numbers that sum to 2020
  """
  def part_1(input) do
    {n, m} =
      input
      |> parse_input()
      |> find_2020()

    n * m
  end

  # Split the input string into a sorted list of integers
  defp parse_input(input) do
    input
    |> String.split()
    |> Enum.map(&String.to_integer/1)
    |> Enum.sort()
  end

  # Create a reversed copy of the list and pass the two lists to the recursive function
  defp find_2020(sorted_list), do: find_2020(sorted_list, Enum.reverse(sorted_list))

  # Sum the smallest and the biggest number of the list
  # - if the sum is bigger than 2020, drop the biggest number
  # - if the sum is smaller than 2020, drop the smallest number
  # - else, we found 2020 and return the two numbers in a tuple
  defp find_2020([hs | _] = s, [hr | tr]) when hs + hr > 2020, do: find_2020(s, tr)
  defp find_2020([hs | ts], [hr | _] = r) when hs + hr < 2020, do: find_2020(ts, r)
  defp find_2020([hs | _], [hr | _]), do: {hs, hr}

  @doc """

  """
  def part_2(input) do
    input
  end
end
