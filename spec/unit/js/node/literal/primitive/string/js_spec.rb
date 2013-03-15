require 'spec_helper'

describe JS::Node::Literal::Primitive::String, '#js' do
  let(:object) { described_class.new(string) }

  examples = {
    ''                                    => '""',
    'yikes!'                              => '"yikes!"',
    'this is a "quoted" word'             => '"this is a \"quoted\" word"',
    'this is a longer string.'            => '"this is a longer string."',
    'the path separator on Windows is \\' => '"the path separator on Windows is \\\\"',
    "some newlines \n"                    => '"some newlines \n"'
  }

  examples.each do |string, expectation|
    context "with #{string.inspect} as input" do
      let(:string) { string }
      expect_js(expectation)
    end
  end
end
