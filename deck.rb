require_relative 'card'
class Deck
  def initialize
    @@deck=[]
    [2,3,4,5,6,7,8,9,10,11,12,13,14].each do |marks|
      %w[C D H S].each do |suits|
        @@deck<<Card.new(suit: suits, mark: marks)
      end
    end
  end

  def self.give_card
    @@deck.delete(@@deck.sample)
  end
end