RSpec.configure do |c|
  c.mock_with :rspec do |mocks|
    mocks.verify_double_constant_names = true
  end
end
