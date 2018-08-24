require 'addressable'
require_relative 'support/uri_shared_examples'

RSpec.describe Addressable do
  it 'parse the scheme' do
    expect(Addressable::URI.parse('https://a.com/').scheme).to eq 'https'
  end
  # it 'parse the host' do
  #   expect(Addressable::URI.parse('https://foo.com/').host).to eq 'foo.com'
  # end
  # it 'parse the port' do
  #   expeect(Addressable::URI.parse('http://example.com:9876').port) eq 9876
  # end
  it_behaves_like 'URI parser', Addressable::URI
  # include_examples 'URI parser', Addressable::URI
  it 'parse the path' do
    expect(Addressable::URI.parse('http://a.com/foo').path).to eq '/foo'
  end
end
