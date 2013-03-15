require 'spec_helper'

describe JS::Node::Literal::Composed::Document::Attribute, '#js' do
  class Node
    include Concord.new(:token)

    def visit(buffer)
      buffer.append(token)
    end
  end

  let(:object) { described_class.new(Node.new('foo'), Node.new('bar')) }

  expect_js('foo: bar')
end
