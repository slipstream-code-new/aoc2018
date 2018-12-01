defmodule AdventOfCode2018.CLI do
  def main(["calibrate", file_path]) do
    {:ok, result} = AdventOfCode2018.calibrate(file_path, &report_frequency_change/1)
    IO.puts "Frequency-calibration successful: " <> Integer.to_string(result)
  end

  def main(_args) do
    IO.puts """
    Supported commands include:

    calibrate FILE
    """
  end

  defp report_frequency_change(freq) do
    IO.puts "Frequency changed to: #{freq}"
  end
end
