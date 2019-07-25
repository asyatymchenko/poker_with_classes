require_relative 'card'
class Combination

  def initialize(player_cards:, desk_cards:)
    @cards = []
    player_cards.each {|card| @cards<<card}
    desk_cards.each {|card| @cards<<card}
  end

  def win_combination

  end

  def royal_flush
    return true
  end

  def straight_flush
    return true
  end

  def four_of_a_kind
    return true
  end

  def full_house
    return true
  end

  def flush
    if checksuit.max >= 5
      puts "true"
    end
    return true
  end

  def straight
    return true
  end

  def three_of_a_kind
    return true
  end

  def two_pair
    return true
  end

  def pair
    return true
  end

  def high_card
    return true
  end

  def checksuit
    suit_counter = Array.new(1,0)
    suit_iterate = 0
    max_sequence_of_cards = []
    sorted_cards = @cards.sort_by { |card| card.suit }
    sorted_cards.each_with_index { |card, index| index == 0 || card.suit == sorted_cards[index-1].suit ? suit_counter[suit_iterate] += 1 : suit_counter[suit_iterate+=1] = 1 }
    suit_iterate = 0
    (0...suit_counter.index(suit_counter.max)).to_a.each {|x| suit_iterate += suit_counter[x]}
    i = suit_iterate
    while i < (suit_iterate + suit_counter.max)
      max_sequence_of_cards << sorted_cards[i]
      i += 1
    end
  end

  def checksequence(cards)
    cards = cards.uniq
    cards.sort_by { |card| card.mark }
    resultarr =[]
    cards.each_with_index { |card,index | index == 0 || card[index] == card[index-1] + 1 ? resultarr << card : resultarr=[]}
    resultarr
  end

  def checkrank(cards)
    repeat_counter = Array.new(1)
    if (cards.uniq).size == cards.size
      return false
    else
      cards.each_with_index { |card, index | index == 0 || card[index].rank == card[index-1].rank ? repeat_counter[index] += 1 : repeat_counter << 1}
    end
    repeat_counter
  end
end