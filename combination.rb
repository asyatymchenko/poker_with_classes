require_relative 'card'
class Combination

  def initialize(player_cards:, desk_cards:)
    @cards = []
    player_cards.each {|card| @cards<<card}
    desk_cards.each {|card| @cards<<card}
    @sequenced_by_suit_cards = check_suit
    @sequenced_by_mark_cards = check_mark
    @sequenced_by_rank_cards = check_rank
  end

  def win_combination
    print_win_combination(@cards)
    return 'royal_flush' if royal_flush
    return 'straight_flush' if straight_flush
    return 'four_of_a_kind' if four_of_a_kind
    return 'full_house' if full_house
    return 'flush' if flush
    return 'straight' if straight
    return 'three_of_a_kind' if three_of_a_kind
    return 'two_pair' if two_pair
    return 'pair' if pair
  end

  def print_win_combination(cards)
    cards.each { |card| Card.print_card(card) }
  end

  def royal_flush
    straight_flush && @sequenced_by_mark_cards[0].mark == 14
  end

  def straight_flush
    @sequenced_by_suit_cards = sort_card_by_marks(@sequenced_by_suit_cards)
    @sequenced_by_suit_cards.size >= 5 && @sequenced_by_mark_cards.size >= 5 && @sequenced_by_suit_cards == @sequenced_by_mark_cards
  end

  def four_of_a_kind
     @sequenced_by_rank_cards[@sequenced_by_rank_cards.key(4)] == 4
  end

  def full_house
    @sequenced_by_rank_cards[@sequenced_by_rank_cards.key(3)] == 3 && @sequenced_by_rank_cards[@sequenced_by_rank_cards.key(2)] == 2
  end

  def flush
    @sequenced_by_suit_cards.size >= 5
  end

  def straight
    @sequenced_by_mark_cards.size >= 5
  end

  def three_of_a_kind
     @sequenced_by_rank_cards[@sequenced_by_rank_cards.key(3)] == 3
  end

  def two_pair
    #@sequenced_by_rank_cards[@sequenced_by_rank_cards.key(2)] == 2 &&
  end

  def pair
    @sequenced_by_rank_cards[@sequenced_by_rank_cards.key(2)] == 2
  end

  def high_card
   Card.print_card(@sequenced_by_mark_cards.max_by {|card| card.mark})
  end

  def check_suit
    @sequenced_by_suit_cards ||=  begin
                                  suit_counter = Array.new(1,0)
                                  iterator = 0

                                  sorted_cards = @cards.sort_by { |card| card.suit }
                                  sorted_cards.each_with_index { |card, index| index.zero? || card.suit == sorted_cards[index-1].suit ? suit_counter[iterator] += 1 : suit_counter[iterator+=1] = 1 }

                                  fill_result_array(suit_counter,sorted_cards)
                                  end

  end

  def check_mark
    @sequenced_by_mark_cards ||=  begin
                                  marks_counter = Array.new(1,0)
                                  iterator = 0

                                  sorted_cards = sort_card_by_marks(@cards)
                                  sorted_cards.each_with_index { |card,index | index.zero? || card.mark == (sorted_cards[index-1].mark - 1) ? marks_counter[iterator] += 1 : marks_counter[iterator+=1] = 1 }

                                  fill_result_array(marks_counter,sorted_cards)
                                  end

  end

  def check_rank
    @sequenced_by_rank_cards ||=  begin
                                  repeat_counter = Array.new(1,0)
                                  iterator = 0

                                  sorted_cards = sort_card_by_marks(@cards)
                                  sorted_cards.each_with_index { |card, index | index.zero? || card.mark == sorted_cards[index-1].mark ? repeat_counter[iterator] += 1 : repeat_counter[iterator+=1] = 1}

                                  hash_with_ranks = Hash.new
                                  sorted_cards = clean_from_repetitions(sorted_cards)
                                  repeat_counter.each_with_index {|value,index| hash_with_ranks[sorted_cards[index]] = value }

                                  hash_with_ranks
    end
  end

  def clean_from_repetitions(cards)
    result = []
    cards.each_with_index {|card, index| result << card if index.zero? || card.mark != cards[index-1].mark }
    result
  end

  def sort_card_by_marks(cards)
    sorted_cards = cards.uniq
    sorted_cards = sorted_cards.sort_by { |card| card.mark }.reverse
    sorted_cards
  end

  def fill_result_array(counter, cards)
    iterator = 0
    result_array = []

    (0...counter.index(counter.max)).to_a.each {|x| iterator += counter[x]}
    i = iterator
    while i < (iterator + counter.max)
      result_array << cards[i]
      i += 1
    end
    result_array
  end

end