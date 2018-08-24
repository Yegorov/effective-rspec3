require 'pp'

RSpec.describe Hash, :outer_group do
  it 'is used by RSpec for metadata', :fast, :focus do |example|
    pp example.metadata
  end
end

=begin
RSpec.configure do |config|
  config.around(:example) do |example|
    pp. example.metadata
  end
end

RSpec.describe 'Music storage' do
  let(:s3_client) do |example|
    S3Client.for(example.metadata[:s3_adapter])
  end

  it 'stores music on the real S3', s3_adapter: :real do
  end
  it 'stores music on an in-memory S3', s3_adapter: :memory do
  end
end
=end

RSpec.configure do |c|
  c.filter_run_excluding :jruby_only unless RUBY_PLATFORM == 'java'
end

# rspec --tag fast
# rspec --tag ~fast or rspec --tag '~fast' (not fast spec)
# rspec --tag bug_id:123
