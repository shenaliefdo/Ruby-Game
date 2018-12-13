require_relative 'player'

class BerserkPlayer < Player
    def initialize(name,health=100)
        super
        @w00t_count = 0
    end
    def berserk?
        @w00t_count > 5 ? true : false
    end
    def w00t
        super
        @w00t_count += 1
        if berserk?
            puts  "Berserker is berserk!"
        end
    end
    def blam
        berserk? ? w00t : super
    end
end
