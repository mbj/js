require 'spec_helper'

describe JS::Node::Operator::Ternary, '#js' do

  let(:condition) { JS::Node::Literal.build(true)    }
  let(:left)      { JS::Node::Literal.build('left')  }
  let(:right)     { JS::Node::Literal.build('right') }

  let(:object)    { described_class.new(condition, left, right) }

  expect_js('true ? "left" : "right"')
end
