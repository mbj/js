require 'spec_helper'

describe JS::Node::Operator::Nary, '#js' do

  let(:object) { class_under_test.new(body) }

  let(:class_under_test) do
    Class.new(described_class) do
      const_set('SYMBOL', 'foo')
    end
  end

  let(:a) { JS.name_node(:a) }
  let(:b) { JS.name_node(:b) }
  let(:c) { JS.name_node(:c) }

  context 'with one element body' do
    let(:body) { [a] }
    expect_js 'a'
  end

  context 'with two element body' do
    let(:body) { [a, b] }
    expect_js '(a foo b)'
  end

  context 'with three element body' do
    let(:body) { [a, b, c] }
    expect_js '(a foo b foo c)'
  end
end
