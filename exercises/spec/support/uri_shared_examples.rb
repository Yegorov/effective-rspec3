RSpec.shared_examples 'URI parser' do |uri_class|
  it 'parses the host' do
    expect(uri_class.parse('http://foo.com/').host).to eq 'foo.com'
  end
  it 'parses the port' do
    expect(uri_class.parse('http://example.com:9876').port).to eq 9876
  end
end
