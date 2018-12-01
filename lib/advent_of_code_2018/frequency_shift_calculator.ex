defmodule AdventOfCode2018.FrequencyShiftCalculator do
  def calibrate([]), do: {:ok, 0}

  def calibrate(operations, reporter \\ fn _ -> nil end) do
    operations
    |> parse
    |> check_for_never_ending_list
    |> perform_calibration(reporter)
  end

  defp all_the_same_type?(operations) do
    Enum.all?(operations, &is_positive?/1) ||
      Enum.all?(operations, &is_negative?/1)
  end

  def is_positive?(n), do: n >= 0
  def is_negative?(n), do: !is_positive?(n)

  defp perform_calibration({:ok, operations}, reporter) do
    result = operations
    |> Stream.cycle
    |> reduce_until_duplicate_found(reporter)
    {:ok, result}
  end
  defp perform_calibration(result, _reporter), do: result

  defp parse(operations) do
    result = Enum.map(operations, fn operation ->
      operation
      |> String.trim
      |> String.to_integer
    end)
    {:ok, result}
  end

  defp check_for_never_ending_list({:ok, operations}) do
    if all_the_same_type?(operations) do
      {:error, "frequency will never normalize"}
    else
      {:ok, operations}
    end
  end

  defp reduce_until_duplicate_found(operations, reporter) do
    Enum.reduce_while(operations, {0, MapSet.new}, fn change, {current, seen} ->
      result = current + change
      reporter.(result)
      if Enum.member?(seen, result) do
        {:halt, result}
      else
        {:cont, {result, MapSet.put(seen, result)}}
      end
    end)
  end
end
