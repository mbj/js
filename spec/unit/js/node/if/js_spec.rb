require 'spec_helper'

describe JS::Node::If, '#js' do
  let(:object) { described_class.new(condition, if_branch, else_branch) }

  let(:condition) { JS.name_node('foo') }

  let(:if_branch)   { JS.literal_node(1) }
  let(:else_branch) { JS.literal_node(2) }

  context 'without else branch' do
    let(:else_branch) { nil }

    expect_js('if (foo) { 1 }')
  end

  context 'with else branch' do
    expect_js('if (foo) { 1 } else { 2 }')
  end
end
