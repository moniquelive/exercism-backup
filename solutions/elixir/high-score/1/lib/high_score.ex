defmodule HighScore do
  def new(),
    do: %{}

  def add_player(scores, name, score \\ 0),
    do: Map.put(scores, name, score)

  def remove_player(scores, name),
    do: Map.delete(scores, name)

  def reset_score(scores, name),
    do: Map.put(scores, name, 0)

  def update_score(scores, name, score) do
    current_score = Map.get(scores, name, 0)
    Map.put(scores, name, current_score + score)
  end

  def get_players(scores),
    do: Map.keys(scores)
end
