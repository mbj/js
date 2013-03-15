require 'spec_helper'

describe JS::Node::Operator::Unary::Prefix, '#js' do
  let(:class_under_test) do
    Class.new(described_class) do
      const_set('SYMBOL', ':')
    end
  end

  let(:object) { class_under_test.new(JS::Node::Literal.build(1)) }
  expect_js(':1')
end
