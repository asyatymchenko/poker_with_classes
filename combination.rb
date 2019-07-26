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

    return true
  end

  def straight

    puts check_sequence
  end

  def three_of_a_kind
    return true
  end

  def two_pair
    puts check_rank
    return true
  end

  def pair
    return true
  end

  def high_card
    true
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

  def check_sequence
    @sequenced_by_mark_cards ||=  begin
                                  marks_counter = Array.new(1,0)
                                  iterator = 0

                                  sorted_cards = sort_card_by_marks
                                  sorted_cards.each_with_index { |card,index | index.zero? || card.mark == (sorted_cards[index-1].mark - 1) ? marks_counter[iterator] += 1 : marks_counter[iterator+=1] = 1 }

                                  fill_result_array(marks_counter,sorted_cards)
                                  end

  end

  def check_rank
    repeat_counter = Array.new(1,0)
    iterator = 0

    sorted_cards = sort_card_by_marks
    sorted_cards.each_with_index { |card, index | index.zero? || card.mark == sorted_cards[index-1].mark ? repeat_counter[iterator] += 1 : repeat_counter[iterator+=1] = 1}

    repeat_counter
  end

  def sort_card_by_marks
    sorted_cards = @cards.uniq
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

  def foo
    @foo ||= begin
      puts "hit"
      222
    end
  end
end