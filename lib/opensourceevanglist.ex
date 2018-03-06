defmodule opensourceevangelist do
  @moduledoc """
  Documentation for opensourceevangelist.
  """

  def get_evangelist(github_username) do
    GitHub.start
    body = GitHub.get!("/users/" <> github_username).body
    case body do
      %{"public_repos" => public_repos} 
        when public_repos > 0 and public_repos < 5 ->  "None Evangelist"
      %{"public_repos" => public_repos} 
        when public_repos >= 5 and public_repos <= 10 ->  "Junior Evangelist"
      %{"public_repos" => public_repos} 
        when public_repos >= 11 and public_repos <= 20 ->  "Associate Evangelist"
      %{"public_repos" => public_repos} 
        when public_repos >= 21 ->  "Senior Evangelist"
       _ -> "No data found"
    end
  end
end

defmodule GitHub do
  use HTTPoison.Base

  @expected_fields ~w(
    login public_repos
  )

  def process_url(url) do
    "https://api.github.com" <> url
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
    |> Map.take(@expected_fields)
    # |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
  end
end
