require 'spec_helper'

describe JS::Node::Function, '#js' do
  let(:object) { described_class.new(arguments, body) }

  let(:body) { JS.literal_node(1) }

  context 'with empty arguments' do
    let(:arguments) { [] }

    expect_js('function() { 1 }')
  end

  context 'with one argument' do
    let(:arguments) { [JS.name_node('foo')] }

    expect_js('function(foo) { 1 }')
  end

  context 'with two arguments' do
    let(:arguments) { [JS.name_node('foo'), JS.name_node('bar')] }

    expect_js('function(foo, bar) { 1 }')
  end
end
