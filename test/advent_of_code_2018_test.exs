defmodule AdventOfCode2018Test do
  use ExUnit.Case
  doctest AdventOfCode2018

  test "calculates resulting frequency" do
    assert {:ok, 3} = AdventOfCode2018.calculate_frequency_shift(
      "./test/fixtures/frequency_shifts_1.txt"
    )

    assert {:ok, -6} = AdventOfCode2018.calculate_frequency_shift(
      "./test/fixtures/frequency_shifts_2.txt"
    )
  end
end
