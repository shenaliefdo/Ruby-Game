require_relative 'die'
require_relative 'player'
require_relative 'treasure_trove'
module GameTurn
    def self.take_turn(p)
        die = Die.new
        rand = TreasureTrove.random
        if die.roll > 4
            p.w00t
            p.found_treasure(rand)
            p.points
        elsif die.roll > 2
            puts "#{p.name} was skipped!"
            p.found_treasure(rand)
            p.points
        else
            p.blam
            p.found_treasure(rand)
            p.points
        end
    end
end