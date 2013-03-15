require 'spec_helper'

describe JS::Node::While, '#js' do
  let(:object) { described_class.new(condition, body) }

  let(:condition) { JS.name_node('foo') }
  let(:body)      { JS.literal_node(1) }

  expect_js('while (foo) { 1 }')
end
