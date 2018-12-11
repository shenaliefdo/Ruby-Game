require_relative 'game'

knuckleheads = Game.new("Knuckleheads")

filename = ARGV[0] || "players.csv"

knuckleheads.load_players(filename)

loop do
    puts "How many game rounds? ('quit' to exit)"
    answer = STDIN.gets.chomp.downcase
    case answer
    when /^\d+$/
        knuckleheads.play(answer.to_i)
    when 'quit', 'exit'
        knuckleheads.print_stats
        break
    else
        puts "Please enter a number or 'quit'"
    end 
end

writefile = ARGV[1] || "high_scores.txt"
knuckleheads.save_high_scores(writefile)



