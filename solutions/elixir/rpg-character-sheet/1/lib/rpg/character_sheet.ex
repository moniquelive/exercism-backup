defmodule RPG.CharacterSheet do
  def welcome(),
    do: IO.puts("Welcome! Let's fill out your character sheet together.")

  def ask_name() do
    IO.puts("What is your character's name?")
    IO.read(:stdio, :line) |> String.trim()
  end

  def ask_class() do
    IO.puts("What is your character's class?")
    IO.read(:stdio, :line) |> String.trim()
  end

  def ask_level() do
    IO.puts("What is your character's level?")

    IO.read(:line)
    |> String.trim()
    |> String.to_integer()
  end

  def run() do
    welcome()

    sheet = %{
      name: ask_name(),
      class: ask_class(),
      level: ask_level()
    }

    IO.puts("Your character: " <> inspect(sheet))
    sheet
  end
end
