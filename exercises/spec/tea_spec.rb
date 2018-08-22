class Tea
  def flavor
    :earl_grey
  end

  def temperature
    205.0
  end
end

RSpec.configure do |c|
  c.example_status_persistence_file_path = 'spec/example.txt'
end

RSpec.describe Tea do
  let(:tea) { Tea.new }

  it 'tastes like Earl Grey' do
    expect(tea.flavor).to be :earl_grey
  end

  it 'is hot' do
    expect(tea.temperature).to be > 200.0
  end
end

# rspec
# rspec --next-failure
# rspec --next-failure
# rspec -fh -o examples.html --no-color
