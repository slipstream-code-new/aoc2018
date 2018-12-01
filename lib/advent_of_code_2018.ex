defmodule AdventOfCode2018 do
  alias AdventOfCode2018.FrequencyShiftCalculator

  def calibrate(frequency_shift_file) do
    frequency_shift_file
    |> File.stream!
    |> Enum.into([])
    |> FrequencyShiftCalculator.calibrate
  end
end
