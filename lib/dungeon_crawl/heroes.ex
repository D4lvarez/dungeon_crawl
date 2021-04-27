defmodule DungeonCrawl.Heroes do
  alias DungeonCrawl.Character

  def all, do: [
  %Character{
    name: "Knight",
    description: "Strong defense and consistent damage",
    hit_points: 18,
    max_hit_points: 18,
    damage_range: 4.5,
    attack_description: "Sword"
  },
    %Character{
      name: "Wizard",
      description: "Strong attack, low health",
      hit_points: 8,
      max_hit_points: 8,
      damage_range: 6.8,
      attack_description: "Fireball"
    },
    %Character{
      name: "Rogue",
      description: "Variable damage",
      hit_points: 12,
      max_hit_points: 12,
      damage_range: 1..12,
      attack_description: "Dagger"
    }
  ]
end
