defmodule AdventOfCode2018.FrequencyShiftCalculatorTest do
  use ExUnit.Case
  doctest AdventOfCode2018.FrequencyShiftCalculator

  import AdventOfCode2018.FrequencyShiftCalculator, only: [calibrate: 1]

  describe "calibrate with an empty list" do
    test "the result is 0" do
      assert {:ok, 0} = calibrate([])
    end
  end

  describe "calibrate with a list containing only add operations" do
    test "the result is an error" do
      assert {:error, "frequency will never normalize"} = calibrate(["+1", "+2"])
    end
  end

  describe "calibrate with a list containing only subtract operations" do
    test "the result is an error" do
      assert {:error, "frequency will never normalize"} = calibrate(["-1", "-2"])
    end
  end

  describe "calibrate with a list containing operations that will eventuall normalize" do
    test "the result is the normalized frequency" do
      assert {:ok, 10} = calibrate([
        "+3",
        "+3",
        "+4",
        "-2",
        "-4"
      ])
    end
  end
end
