require_relative 'die'
require_relative 'player'
require_relative 'treasure_trove'
require_relative 'loaded_die'
module GameTurn
    def self.take_turn(p)
        die = Die.new.roll
        rand = TreasureTrove.random
        if die > 4
            p.w00t
            p.found_treasure(rand)
            p.points
        elsif die > 2
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