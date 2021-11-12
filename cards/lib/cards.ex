defmodule Cards do
  @moduledoc """
  Provides methods for creating and handling a deck of cards.
  """

  @doc """
  Returns a list of strings representing a deck of playing cards.

  ## Examples

      iex> Cards.create_deck
      ["Ace of Spades", "Two of Spades", "Three of Spades", "Four of Spades",
      "Five of Spades", "Ace of Clubs", "Two of Clubs", "Three of Clubs",
      "Four of Clubs", "Five of Clubs", "Ace of Hearts", "Two of Hearts",
      "Three of Hearts", "Four of Hearts", "Five of Hearts", "Ace of Diamonds",
      "Two of Diamonds", "Three of Diamonds", "Four of Diamonds", "Five of Diamonds"]

  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of " <> "#{suit}"
    end
  end

  @doc """
  Shuffles a deck of cards.

  ## Examples
      iex> deck = Cards.create_deck
      ["Ace of Spades", "Two of Spades", "Three of Spades", "Four of Spades",
      "Five of Spades", "Ace of Clubs", "Two of Clubs", "Three of Clubs",
      "Four of Clubs", "Five of Clubs", "Ace of Hearts", "Two of Hearts",
      "Three of Hearts", "Four of Hearts", "Five of Hearts", "Ace of Diamonds",
      "Two of Diamonds", "Three of Diamonds", "Four of Diamonds", "Five of Diamonds"]
      iex> Cards.shuffle(deck)

  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Checks if a card is present in a deck.

  ## Examples
      iex> deck = Cards.create_deck
      ["Ace of Spades", "Two of Spades", "Three of Spades", "Four of Spades",
      "Five of Spades", "Ace of Clubs", "Two of Clubs", "Three of Clubs",
      "Four of Clubs", "Five of Clubs", "Ace of Hearts", "Two of Hearts",
      "Three of Hearts", "Four of Hearts", "Five of Hearts", "Ace of Diamonds",
      "Two of Diamonds", "Three of Diamonds", "Four of Diamonds", "Five of Diamonds"]
      iex> Cards.contain?(deck, "Two of Spades")
      true

  """

  def contain?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Returns a tuple containing the hand and the remainder of the deck.
  The `hand_size` argument indicates how many cards should the hand include.

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, _deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
  Returns a list of cards with a specified size.

  ## Examples

        iex> Cards.create_hand(1)

  """

  def create_hand(hand_size) do
    {hand, _remaining} =
      Cards.create_deck()
      |> Cards.shuffle()
      |> Cards.deal(hand_size)

    hand
  end

  @doc """
  Save a deck into a specified file.

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.save(deck, "deck")

  """

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
  Load a deck from a previously saved file.

  ## Examples
      iex> deck = Cards.create_deck
      iex> Cards.save(deck, "deck")
      iex> Cards.load("deck")

  """

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, reason} -> "File does not exist (" <> Atom.to_string(reason) <> ")."
    end
  end
end
