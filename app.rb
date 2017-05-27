require_relative "lib/tictactoe"
BEGIN{
    puts "Comenzile sunt 1 1 x, 0 0 0, etc."
}
game = TicTacToe::Game.new
game.play
END{
    puts "Program realizat de practicingruby/tictactoe."
    puts "GITHUB: https://github.com/mhcrnl/tictactoe/blob/master/app.rb"
}
