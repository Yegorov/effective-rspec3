RSpec.configure do |config|
  #config.filter_run_when_matching(focus: true)
  config.example_status_persistence_file_path = 'spec/example.txt'
end

class Coffee
  def ingredients
    @ingredients ||= []
  end

  def add(ingredient)
    ingredients << ingredient
  end

  def price
    1.00 + ingredients.size * 0.25
  end

  def color
    ingredients.include?(:milk) ? :light : :dark
  end

  def temperature
    ingredients.include?(:milk) ? 190.0 : 205.0
  end
end

RSpec.describe 'A cup of coffee' do
  let(:coffee) { Coffee.new }

  it 'costs $1', :my do
    expect(coffee.price).to eq(1.00)
  end

  fcontext "with milk" do # context "...", focus: true
    before { coffee.add :milk }

    it 'costs $1.25' do
      expect(coffee.price).to eq(1.25)
    end
  end

  xit 'is light in color' do
    pending 'Color not implemented yet'
    expect(coffee.color).to be(:light)
  end
  it 'is cooler than 200 degrees Fahrenheit' do
    pending 'Temperature not implemented yet'
    expect(coffee.temperature).to be < 200.0
  end
end

# rspec --help
# rspec --format documentation or rspec -fd
# rspec --profile 2
# rspec -e part_namename_example -fd
# rspec --only-failures
# rspec --tag last_run_status:failed
# rspec --tag focus
# rspec --tag my
