# Los Protocol son Interfaces de POO
defprotocol DungeonCrawl.Display do
  def info(value)
end

# defimpl se emplea para implementar un protocol en una funcion
defimpl DungeonCrawl.Display, for: DungeonCrawl.Room.Action do
  def info(action), do: action.label
end
  
defimpl DungeonCrawl.Display, for: DungeonCrawl.Character do
  def info(character), do: character.name
end
