require_relative 'card'
require_relative 'player'
require_relative 'deck'
class Game
  def initialize
    deck = Deck.new
    player = Player.new
    @desk_cards = []
    @player_cards = player.cards_in_hand
  end

  def play
    fill_desk

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
