defmodule AdventOfCode2018.FrequencyShiftCalculator do
  def calibrate([]), do: {:ok, 0}

  def calibrate(operations, reporter \\ fn _ -> nil end) do
    if all_the_same_type?(operations) do
      {:error, "frequency will never normalize"}
    else
      {:ok, perform_calibration(operations, reporter)}
    end
  end

  defp all_the_same_type?(operations) do
    Enum.all?(operations, &is_addition?/1) ||
      Enum.all?(operations, &is_subtraction?/1)
  end

  defp is_addition?("+" <> _), do: true
  defp is_addition?("-" <> _), do: false
  defp is_addition?(operation), do: raise("Invalid frequency shift: #{operation}")
  defp is_subtraction?(operation), do: !is_addition?(operation)

  defp perform_calibration(operations, reporter) do
    operations
    |> parse
    |> Stream.cycle
    |> reduce_until_duplicate_found(reporter)
  end

  defp parse(operations) do
    Enum.map(operations, fn operation ->
      operation
      |> String.trim
      |> String.to_integer
    end)
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
