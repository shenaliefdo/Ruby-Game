require_relative 'player'

describe Player do
    before do
        @health = 80
        @player = Player.new("shenalie", @health)
    end
    it "has a capitalized name" do
        @player.name.should == "Shenalie"
    end
    it "has an initial health" do
        @player.health.should == 80
    end
    it "has a string representation" do
        @player.to_s.should == "I'm Shenalie with a health of 80 and a score of 88"
    end
    it "computes a score as the sum of its health and length of name" do
        @player.score.should == @health + @player.name.length
    end
    it "increased health by 15" do
        @player.w00t
        @player.health.should == @health + 15
    end
    it "decreases health by 10" do
        @player.blam
        @player.health.should == @health - 10
    end
    context "strong" do
        before do
            @health = 150
            @player = Player.new("shenalie", @health)
        end
        it "checks if player is strong" do
            @player.strong?.should == true
        end
    end
    context "weak" do
        before do
            @health = 100
            @player = Player.new('Tyler', @health)
        end
        it "checks if player is weak" do
            @player.strong?.should == false
        end
    end
end