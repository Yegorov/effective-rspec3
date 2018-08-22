Sandwich = Struct.new(:taste, :toppings)

RSpec.describe 'An ideal sandwich' do
  # before { @sandwich = Sandwich.new('delicious', []) } # before hook

  # Helper method
  # def sandwich
  #   @sandwich ||= Sandwich.new('delicious', [])
  # end

  # Sharing Objects
  let(:sandwich) { Sandwich.new('delicious', []) }

  it 'is delicious' do
    #sandwich = Sandwich.new('delicious', [])
    taste = sandwich.taste

    expect(taste).to eq('delicious')
  end
  it 'lets me add toppings' do
    #sandwich = Sandwich.new('delicious', [])
    sandwich.toppings << 'cheese'
    toppings = sandwich.toppings

    expect(toppings).not_to be_empty
  end
end
