require 'spec_helper'

describe JS::Node::Name, '#aql' do
  let(:object) { described_class.new(name) }

  let(:name) { 'foo' }
  expect_js('foo')
end
