defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 20 cards" do
    deck = Cards.create_deck
    deck_length = length(deck)
    assert deck_length == 20
  end

  test "shuffle changes the position of the cards in a deck" do
    deck = Cards.create_deck
    shuffled_deck = Cards.shuffle(deck)
    refute deck == shuffled_deck
  end

  test "contain? method returns true if a member is present in the list" do
    deck = Cards.create_deck
    assert Cards.contain?(deck, "Ace of Spades") == true
  end
end
