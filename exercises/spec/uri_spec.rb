require 'uri'
require_relative 'support/uri_shared_examples'

RSpec.describe URI do
  # it 'parses the host' do
  #   expect(URI.parse('http://foo.com/').host).to eq 'foo.com'
  # end
  # it 'parses the port' do
  #   expect(URI.parse('http://example.com:9876').port).to eq 9876
  # end
  it_behaves_like 'URI parser', URI
  # include_examples 'URI parser', URI

  it 'defaults the port for an http URI to 80' do
    expect(URI.parse('http://example.com').port).to eq 80
  end
  it 'defaults the port for an https URI to 443' do
    expect(URI.parse('https://example.com/').port).to eq 443
  end
end
