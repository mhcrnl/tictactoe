require_relative "lib/tictactoe"
BEGIN{
    time1 = Time.new
    puts "Comenzile sunt 1 1 x, 0 0 0, etc."
    puts "Rularea programului a inceput: "+ time1.inspect
}
game = TicTacToe::Game.new
game.play
END{
    time2 = Time.now
    puts "Program realizat de practicingruby/tictactoe."
    puts "GITHUB: https://github.com/mhcrnl/tictactoe/blob/master/app.rb"
    puts "Rularea programului s-a incheiat: " + time2.inspect
}
