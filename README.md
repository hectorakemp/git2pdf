# Git2pdf

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `git2pdf` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:git2pdf, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/git2pdf](https://hexdocs.pm/git2pdf).

## Description

This program converts git repositories into pdf ebooks, so they can read like a book on an e-reader, such as a Kindle or Onyx Boox.

It takes in a local git repo as a path, and then spits out a converted pdf with the directory tree as the table of contents, and each page a file in the repository. The folder structure is something like the code block below.
```
		  .elixir_ls
		  .git
		  lib
		  test
			  .formatter.exs
			  .gitignore
			  README.md
			  mix.exs
```

