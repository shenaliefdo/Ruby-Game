require_relative 'playable'

class Player
    include Playable
    attr_reader :health
    attr_accessor :name 
    def initialize(name,health=100)
        @name = name.capitalize
        @health = health
        @found_treasure = Hash.new(0)
    end
    def found_treasure(treasure)
        @found_treasure[treasure.name] += treasure.points
        puts "#{@name} found a #{treasure.name} worth #{treasure.points} points." 
        puts "#{@name}'s treasures: #{@found_treasure}"
    end
    def each_found_treasure
        @found_treasure.each {|key, value| puts "#{value} total #{key} points"}
    end
    def points
        @found_treasure.values.reduce(0,:+)
    end
    def score
        @health + points
    end
    def to_s
        "I'm #{@name} with a health = #{@health}, points = #{points}, and a score = #{score}"
    end
    def <=>(other_player)
        other_player.score <=> score
    end
    def name=(new_name)
        @name = new_name.capitalize
    end
end