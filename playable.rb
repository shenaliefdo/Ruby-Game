module Playable
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
end