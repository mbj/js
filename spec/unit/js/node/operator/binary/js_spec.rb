require 'spec_helper'

describe JS::Node::Operator::Binary, '#js' do
  let(:class_under_test) do
    Class.new(described_class) do
      const_set('SYMBOL', '||')
    end
  end

  let(:left)  { JS::Node::Literal.build(true)  }
  let(:right) { JS::Node::Literal.build(false) }
  let(:object) { class_under_test.new(left, right) }

  expect_js('(true || false)')
end
