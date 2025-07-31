defmodule LogParser do
  def valid_line?(line),
    do: line =~ ~r{^(\[DEBUG\]|\[INFO\]|\[WARNING\]|\[ERROR\])}

  def split_line(line),
    do: line |> String.split(~r{<[~*=-]*>}, parts: :infinity)

  def remove_artifacts(line),
    do: line |> String.replace(~r{end-of-line\d+}i, "")

  def tag_with_user_name(line) do
    ~r{User\s+(?<username>\S+)}iu
    |> Regex.named_captures(line, capture: :first)
    |> case do
      %{"username" => username} ->
        "[USER] #{username} " <> line

      _ ->
        line
    end
  end
end
