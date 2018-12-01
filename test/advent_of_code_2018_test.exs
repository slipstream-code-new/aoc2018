defmodule AdventOfCode2018Test do
  use ExUnit.Case
  doctest AdventOfCode2018

  test "calibrates frequency" do
    assert {:ok, 2} = AdventOfCode2018.calibrate(
      "./test/fixtures/frequency_shifts_1.txt"
    )

    assert {:ok, 10} = AdventOfCode2018.calibrate(
      "./test/fixtures/frequency_shifts_2.txt"
    )
  end
end
