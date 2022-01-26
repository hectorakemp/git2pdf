defmodule Git2pdf do
  @moduledoc """
  Documentation for `Git2pdf`.
  Converts a git repo into a structured pdf based on the repo's file hierarchy.
  Read a git repo
  Try printing out files in their entirety??
  use gitignore
  """

  @doc """
  Hello world.

  ## Examples

      iex> Git2pdf.hello()
      :world

  """
  def hello do
    :world
  end

  def gitignore_file_list(path) do
    File.stream!(path) |>
      Stream.map(&String.trim(&1)) |>
      Stream.filter(&String.length(&1) > 0) |>
      Stream.filter(fn s -> !String.starts_with?(s, "#") end) |>
      Enum.to_list
  end
end
