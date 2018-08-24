RSpec.describe 'test new formaters' do
  describe 'A group with a failure has an example that fails' do
    it 'pass' do
      expect(1).to eq 1
    end
    it 'fails' do
      expect(1).to eq 2
    end
  end
  describe 'Another group with a failure has an example that fails' do
    it 'pass' do
      expect(1).to eq 1
    end
    it 'fails' do
      expect(1).to eq 2
    end
  end
end
