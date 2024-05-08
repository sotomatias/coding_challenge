defmodule CodingChallenge do
  @moduledoc """
  Documentation for `CodingChallenge`.
  """

  @doc """
  Aggregate team score from a list of cards.

  ## Examples

      iex> CodingChallenge.aggregate_team_score([%{name: "Player A", team: "Team X", score: 10},
      ...> %{name: "Player B", team: "Team Y", score: 20}], "Team X")
      10

  """
  @spec aggregate_team_score([%{name: String.t(), team: String.t(), score: integer}], String.t()) ::
          integer
  def aggregate_team_score(cards, team) do
    # Enum.reduce/3 to iterate over the list and to have an accumulator, initialized with 0, if team doesn't have points, it will return 0, otherwise, it will return the points of the team.
    Enum.reduce(cards, 0, fn card, acc ->
      # Maybe function to pattern-match if the team of the current card is equal to the team that we are looking for. If it is, we will sum the score to the acc, otherwise, it will return the acc.
      maybe_add_score(card, team, acc)
    end)
  end

  @spec maybe_add_score(
          %{name: String.t(), team: String.t(), score: integer},
          String.t(),
          integer
        ) :: integer
  def maybe_add_score(%{team: card_team, score: score}, team, acc) when card_team === team do
    acc + score
  end

  def maybe_add_score(_, _, acc), do: acc
end
