defmodule CodingChallengeTest do
  use ExUnit.Case
  doctest CodingChallenge

  describe "aggregate_team_score/2" do
    setup do
      cards = [
        %{name: "Player A", team: "Team X", score: 10},
        %{name: "Player B", team: "Team Y", score: 20},
        %{name: "Player C", team: "Team X", score: 15},
        %{name: "Player D", team: "Team Z", score: 5}
      ]

      %{cards: cards}
    end

    test "should return 25", %{cards: cards} do
      assert CodingChallenge.aggregate_team_score(cards, "Team X") == 25
    end

    test "should return 5", %{cards: cards} do
      assert CodingChallenge.aggregate_team_score(cards, "Team Z") == 5
    end

    test "should return 0", %{cards: cards} do
      assert CodingChallenge.aggregate_team_score(cards, "Team A") == 0
    end
  end
end
