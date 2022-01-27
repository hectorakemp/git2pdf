defmodule Git2pdf do
  @moduledoc """
  Documentation for `Git2pdf`.
  Converts a git repo into a structured pdf based on the repo's file hierarchy.
  Read a git repo
  Try printing out files in their entirety??
  use gitignore
  for a folder, print all
  use wkhtmltopdf
  table of contents?
  sorted directory, then files (alphabetically)
  xslt
  only use <tbody print style from github>
  use https://github.com/gutschilla/elixir-pdf-generator
  """

  @doc """
  Converts a .gitignore file into a list of relative string filenames.
  """
  def gitignore_file_list(gitignore_path) do
    File.stream!(gitignore_path) |>
      Stream.map(&String.trim(&1)) |>
      Stream.filter(&String.length(&1) > 0) |>
      Stream.filter(&!String.starts_with?(&1, "#")) |>
      Enum.to_list
  end

  def filter_gitignore(file_list, gitignore_list) do
    file_list |>
      Enum.filter(
        fn file ->
          not Enum.any?(
            gitignore_list,
            fn g -> String.contains?(file, g) end
          )
        end
      )
  end

  @doc """
    Recursively walks a directory structure sorted by and builds a tree
    structure, where folders are branches, and files are leaves.
    If
  """
  # def directory_files_tree() do
  #   if
  #   File.ls |>
  #     Kernel.then(fn {:ok, list} -> list end) |>
  # end
  #
  def expanded_ls(path) do
    File.ls(path)
    |> then(fn {:ok, res} -> res end)
    |> Enum.map(&Path.expand(&1))
  end

  def sort_folders_first_then_files(ls_result) do
    %{true: folders, false: files} = Enum.group_by(ls_result, &File.dir?(&1))
    Enum.concat(Enum.sort(folders), Enum.sort(files))
  end
end
