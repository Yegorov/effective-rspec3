require 'guessing_game'

RSpec.describe GuessingGame do
  let(:game) { GuessingGame.new }

  it 'test win' do
    expect_any_instance_of(Kernel).to receive(:gets).and_return("5")
    stdout = object_spy($stdout)
    game.stdout = stdout
    game.play(number: 5)

    expect(stdout).to have_received(:puts).with("You won!")
  end
end
