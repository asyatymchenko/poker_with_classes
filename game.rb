require_relative 'card'
require_relative 'player'
require_relative 'deck'
require_relative 'combination'
class Game
  def initialize
    @deck_cards = Deck.new
    @desk_cards = []
    player = Player.new
    @player_cards = player.cards_in_hand
  end

  def play
    fill_desk
    combination = Combination.new(player_cards: @player_cards, desk_cards: @desk_cards)
    puts combination.win_combination
  end

  def count_iterations
    @deck_cards.new_deck
  end

  def fill_desk
    5.times{@desk_cards<<Deck.give_card}
  end

  def print_desk
    puts 'Desk cards:'
    @desk_cards.each {|card| Card.print_card(card) }
  end
end

game = Game.new()
game.play