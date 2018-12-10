require_relative 'player'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game
    attr_reader :title
    attr_accessor :die
    def initialize(title)
       @title = title
       @players = []
    end
    def add_player(p)
        @players << p
    end
    def play(round)
        puts "There are #{@players.length} players in #{@title}:"
        @players.each do |p|
            puts p
        end
        treasures = TreasureTrove::TREASURES
        puts "\nThere are #{treasures.size} treasures to be found:\n"
        treasures.each do |treasure|
            puts "A #{treasure.name} is worth #{treasure.points} points"
        end
        
        1.upto(round) do |r|
            puts "\nRound #{r}:"
            @players.each do |p|
                GameTurn.take_turn(p)
                puts p
            end
        end
    end
    def print_stats
        strong = []
        wimpy = []
        @players.each do |p|
            if p.strong?
                strong << p
            else
                wimpy << p
            end
        end
        puts "\n#{@title} Statistics:"
        puts "\n#{strong.length} strong players:"
        strong.each do |i|
            puts "#{i.name} (#{i.health})"
        end
        puts "\n#{wimpy.length} wimpy players:"
        wimpy.each do |i|
            puts "#{i.name} (#{i.health})"
        end
        puts "\n#{title} High Scores:"
        sorted_players = @players.sort.each do |p|
           puts "#{p.name}.....#{p.score}"
        end
    end
end