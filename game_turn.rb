require_relative 'die'
require_relative 'player'
require_relative 'treasure_trove'
module GameTurn
    def self.take_turn(p)
        die = Die.new
        rand = TreasureTrove.random
        if die.roll > 4
            p.w00t
            puts "#{p.name} found a #{rand.name} worth #{rand.points} points"
        elsif die.roll > 2
            puts "#{p.name} was skipped!"
            puts "#{p.name} found a #{rand.name} worth #{rand.points} points"
        else
            p.blam
            puts "#{p.name} found a #{rand.name} worth #{rand.points} points"
        end
    end
end