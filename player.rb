class Player
    attr_reader :health
    attr_accessor :name 
    def score
        @health + @name.length
    end
    def initialize(name,health=100)
        @name = name.capitalize
        @health = health
    end
    def to_s
        "I'm #{@name} with a health of #{@health} and a score of #{score}"
    end
    def <=>(other_player)
        other_player.score <=> score
    end
    def strong?
        if @health >100
            true
        else
            false
        end
    end
    def w00t
        @health = @health + 15
        puts "#{@name} got w00ted!"
    end
    def blam
        @health = @health - 10
        puts "#{@name} got blammed!"
    end
    def name=(new_name)
        @name = new_name.capitalize
    end
end