defmodule DungeonCrawl.CLI.HeroChoice do
  alias Mix.Shell.IO, as: Shell

  def start do
    Shell.cmd("clear")
    Shell.info("Start by choosing you hero:")

    heroes = DungeonCrawl.Heroes.all()
    find_hero_by_index = &Enum.at(heroes, &1)
    
    heroes
    |> Enum.map(&(&1.name))
    |> display_options
    |> generate_questions
    |> Shell.prompt
    |> parse_answer
    |> find_hero_by_index.()
    |> confirm_hero
  end
  def display_options(options) do
    options
    |> Enum.with_index(1)
    |> Enum.each(fn {option, index} ->
      Shell.info("#{index} - #{option}")
    end)
    options
  end
  defp generate_questions(options) do
    options = Enum.join(1..Enum.count(options), ",")
    "Which one?... [#{options}]\n"
  end
  defp parse_answer(answer) do
    {option, _} = Integer.parse(answer)
    option - 1
  end
  defp confirm_hero(chosen_hero) do
    Shell.cmd("clear")
    Shell.info(chosen_hero.description)
    if Shell.yes?("Confirm?..."), do: chosen_hero, else: start()
  end
end
