require_relative 'game'

describe Game do
    before do
        @game = Game.new("g1")
        @health = 100
        @p1 = Player.new("Shenalie", @health)
        @game.add_player(@p1)
    end
    it "will incraese health by 15 when player rolls 5 or 6" do
        Die.any_instance.stub(:roll).and_return(5)
        @game.play(1)
        @p1.health.should == 115
    end
    it "will do nothing when a roll of 3 or 4 occurs" do
        Die.any_instance.stub(:roll).and_return(3)
        @game.play(1)
        @p1.health.should == 100
    end
    it "will decrease health by 10 when player rolls 1 or 2" do
        Die.any_instance.stub(:roll).and_return(1)
        @game.play(1)
        @p1.health.should == 90
    end
    context "in a collection of players" do
        before do
          @player1 = Player.new("moe", 100)
          @player2 = Player.new("larry", 200)
          @player3 = Player.new("curly", 300)
          @players = [@player1, @player2, @player3]
        end
        it "is sorted by decreasing score" do
          @players.sort.should == [@player3, @player2, @player1]
        end
      end
end