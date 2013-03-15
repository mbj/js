require 'spec_helper'

describe JS::Node::Literal::Composed::Array, '#js' do
  let(:object) { JS::Node::Literal.build(input) }

  examples = {
    []                                        => '[]',
    [1, 2, 3]                                 => '[1, 2, 3]',
    [-99, "yikes!", [ true, [ "no"], []], 1 ] => '[-99, "yikes!", [true, ["no"], []], 1]',
    [["fox", "marshal"]]                      => '[["fox", "marshal"]]',
    [nil]                                     => '[null]'
  }

  examples.each do |input, expectation|
    context "with #{input.inspect} as input" do
      let(:input) { input }
      expect_js(expectation)
    end
  end
end
