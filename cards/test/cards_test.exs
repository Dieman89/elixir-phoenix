defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 20 cards" do
    deck = Cards.create_deck()
    deck_length = length(deck)
    assert deck_length == 20
  end

  test "shuffle changes the position of the cards in a deck" do
    deck = Cards.create_deck()

    shuffled_deck = Cards.shuffle(deck)
    refute deck == shuffled_deck
  end

  test "contain? method returns true if a member is present in the list" do
    deck = Cards.create_deck()
    assert Cards.contain?(deck, "Ace of Spades") == true
  end

  test "deal method returns a tuple that contains two lists, and check that the first list has the right length" do
    deck = Cards.create_deck()

    two_lists =
      Cards.deal(deck, 2)
      |> Tuple.to_list()

    assert length(two_lists) == 2

    size_deal =
      Cards.deal(deck, 2)
      |> elem(0)
      |> length

    assert size_deal == 2
  end

  test "create_hand method deals the right amount of cards" do
    length(Cards.create_hand(5)) == 5
  end

  test "save method creates a file in the root directory and then loads the same content" do
    deck = Cards.create_deck()
    Cards.save(deck, "test_deck")
    assert File.regular?("test_deck") == true
    assert Cards.load("test_deck") == deck
    File.rm("test_deck")
  end
end
