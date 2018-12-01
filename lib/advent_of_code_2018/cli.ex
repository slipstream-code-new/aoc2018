defmodule AdventOfCode2018.CLI do
  def main(["calibrate", file_path]) do
    {:ok, result} = AdventOfCode2018.calibrate(file_path)
    IO.puts "Frequency-calibration successful: " <> Integer.to_string(result)
  end

  def main(_args) do
    IO.puts """
    Supported commands include:

    calibrate FILE
    """
  end
end
