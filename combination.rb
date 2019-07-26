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
    #if checksuit.max >= 5
     # puts "true"
    #end
    return true
  end

  def straight
    if check_sequence.max >= 5
      puts "true"
    end
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

  def check_suit
    suit_counter = Array.new(1,0)
    iterator = 0
    max_sequence_of_cards = []

    sorted_cards = @cards.sort_by { |card| card.suit }
    sorted_cards.each_with_index { |card, index| index == 0 || card.suit == sorted_cards[index-1].suit ? suit_counter[iterator] += 1 : suit_counter[iterator+=1] = 1 }

    iterator = 0
    (0...suit_counter.index(suit_counter.max)).to_a.each {|x| iterator += suit_counter[x]}
    i = iterator
    while i < (iterator + suit_counter.max)
      max_sequence_of_cards << sorted_cards[i]
      i += 1
    end
  end

  def check_sequence
    marks_counter = Array.new(1,0)
    iterator = 0
    max_sequence_of_cards = []

    sorted_cards = @cards.uniq
    sorted_cards = sorted_cards.sort_by { |card| card.mark }.reverse
    sorted_cards.each_with_index { |card,index | index == 0 || card.mark == (sorted_cards[index-1].mark + 1) ? marks_counter[iterator] += 1 : marks_counter[iterator+=1] = 1 }

    iterator = 0
    (0...marks_counter.index(marks_counter.max)).to_a.each {|x| iterator += marks_counter[x]}
    i = iterator
    while i < (iterator + marks_counter.max)
      max_sequence_of_cards << sorted_cards[i]
      i += 1
    end
    max_sequence_of_cards
  end

  def check_rank(cards)
    repeat_counter = Array.new(1)
    if (cards.uniq).size == cards.size
      return false
    else
      cards.each_with_index { |card, index | index == 0 || card[index].rank == card[index-1].rank ? repeat_counter[index] += 1 : repeat_counter << 1}
    end
    repeat_counter
  end
end