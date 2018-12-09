defmodule Aoc.Year2018.Day03 do
  @moduledoc """
  Solution to Day 03 of 2018: No Matter How You Slice It

  ## --- Day 3: No Matter How You Slice It ---

  The Elves managed to locate the chimney-squeeze prototype fabric for Santa's
  suit (thanks to someone who helpfully wrote its box IDs on the wall of the
  warehouse in the middle of the night). Unfortunately, anomalies are still
  affecting them - nobody can even agree on how to *cut* the fabric.

  The whole piece of fabric they're working on is a very large square - at least
  `1000` inches on each side.

  Each Elf has made a *claim* about which area of fabric would be ideal for
  Santa's suit. All claims have an ID and consist of a single rectangle with edges
  parallel to the edges of the fabric. Each claim's rectangle is defined as
  follows:

  - The number of inches between the left edge of the fabric and the left edge of the rectangle.
  - The number of inches between the top edge of the fabric and the top edge of the rectangle.
  - The width of the rectangle in inches.
  - The height of the rectangle in inches.

  A claim like `#123 @ 3,2: 5x4` means that claim ID `123` specifies a rectangle
  `3` inches from the left edge, `2` inches from the top edge, `5` inches wide,
  and `4` inches tall. Visually, it claims the square inches of fabric represented
  by `#` (and ignores the square inches of fabric represented by `.`) in the
  diagram below:

  ```
  ...........
  ...........
  ...#####...
  ...#####...
  ...#####...
  ...#####...
  ...........
  ...........
  ...........
  ```

  The problem is that many of the claims *overlap*, causing two or more claims to
  cover part of the same areas. For example, consider the following claims:

  ```
  #1 @ 1,3: 4x4
  #2 @ 3,1: 4x4
  #3 @ 5,5: 2x2
  ```

  Visually, these claim the following areas:

  ```
  ........
  ...2222.
  ...2222.
  .11XX22.
  .11XX22.
  .111133.
  .111133.
  ........
  ```

  The four square inches marked with `X` are claimed by *both `1` and `2`*. (Claim
  `3`, while adjacent to the others, does not overlap either of them.)

  If the Elves all proceed with their own plans, none of them will have enough
  fabric. *How many square inches of fabric are within two or more cla
  ## --- Part Two ---

  Amidst the chaos, you notice that exactly one claim doesn't overlap by even a
  single square inch of fabric with any other claim. If you can somehow draw
  attention to it, maybe the Elves will be able to make Santa's suit after all!

  For example, in the claims above, only claim `3` is intact after all claims are
  made.

  *What is the ID of the only claim that doesn't overlap?*

  ims?*


  """
  @re ~r/#(\d+) @ (\d+),(\d+): (\d+)x(\d+)/

  @doc """

  """
  def part_1(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.reduce({MapSet.new(), MapSet.new()}, fn string, acc ->
      [_, x, y, w, h] =
        Regex.run(@re, string, capture: :all_but_first) |> Enum.map(&String.to_integer/1)

      positions = for px <- x..(x + w - 1), py <- y..(y + h - 1), do: {px, py}

      Enum.reduce(positions, acc, fn position, {counter, claimed} ->
        if MapSet.member?(claimed, position) do
          {MapSet.put(counter, position), claimed}
        else
          {counter, MapSet.put(claimed, position)}
        end
      end)
    end)
    |> (fn {counter, _} -> Enum.count(counter) end).()
  end

  @doc """

  """
  def part_2(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.reduce({[], Map.new()}, fn string, {ids, claimed} ->
      [id, x, y, w, h] =
        Regex.run(@re, string, capture: :all_but_first) |> Enum.map(&String.to_integer/1)

      positions = for px <- x..(x + w - 1), py <- y..(y + h - 1), do: {px, py}

      {[id | ids],
       Enum.reduce(positions, claimed, fn position, claimed ->
         Map.update(claimed, position, id, &[id, &1 | []])
       end)}
    end)
    |> (fn {ids, claimed} ->
          (ids --
             (Map.values(claimed)
              |> Enum.filter(fn id_s -> is_list(id_s) end)
              |> List.flatten()
              |> Enum.uniq()))
          |> List.first()
        end).()
  end
end
