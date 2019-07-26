require_relative 'card'
require_relative 'player'
require_relative 'deck'
require_relative 'combination'
class Game
  def initialize
    fill_cards
    @combination = Combination.new(@player_cards, @desk_cards)
  end

  def fill_cards
    @deck_cards = Deck.new
    @desk_cards = []
    fill_desk
    player = Player.new
    @player_cards = player.cards_in_hand
  end

  def play
    puts @combination.print_win_combination
    puts "desk"
    print_cards(@desk_cards)
    puts "player"
    print_cards(@player_cards)
    @combination.check_rank
  end

  def count_iterations(combination_to_find)
    iterations_counter = 1
    start_time = Time.now
    while @combination.win_combination != combination_to_find
      iterations_counter += 1
      fill_cards
      @combination = Combination.new(@player_cards, @desk_cards)
      @combination.win_combination
    end
    end_time = Time.now
    puts "iterations: #{iterations_counter};  time: #{end_time - start_time}"
  end

  def fill_desk
    5.times{@desk_cards<<Deck.give_card}
  end

  def print_cards(cards)
    cards.each {|card| Card.print_card(card) }
  end
end

game = Game.new
game.play
#game.count_iterations('pair')