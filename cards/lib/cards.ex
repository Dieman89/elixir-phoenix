defmodule Cards do
  @moduledoc """
  Provides methods for creating and handling a deck of cards.
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of " <> "#{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contain?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def create_hand(hand_size) do
    {hand, _remaining} =
      Cards.create_deck()
      |> Cards.shuffle()
      |> Cards.deal(hand_size)

    hand
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, reason} -> "File does not exist (" <> Atom.to_string(reason) <> ")."
    end
  end
end
