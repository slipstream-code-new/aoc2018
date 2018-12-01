defmodule AdventOfCode2018 do
  alias AdventOfCode2018.FrequencyShiftCalculator

  def calculate_frequency_shift(frequency_shift_file) do
    frequency_shift_file
    |> File.stream!
    |> FrequencyShiftCalculator.calculate_frequency_shift
  end
end
