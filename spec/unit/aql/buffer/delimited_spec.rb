require 'spec_helper'

describe JS::Buffer, '#delimited' do
  let(:object) { described_class.new }

  subject { object.delimited(nodes) }

  context 'with empty nodes' do
    let(:nodes) { [] }

    its(:content) { should eql('') }

    it_should_behave_like 'a command method'
  end

  context 'with one argument' do
    let(:nodes) { [JS::Node::Literal.build(1)] }

    its(:content) { should eql('1') }

    it_should_behave_like 'a command method'
  end

  context 'with multiple argments' do
    let(:nodes) { [JS::Node::Literal.build(1), JS::Node::Literal.build(2)] }

    its(:content) { should eql('1, 2') }

    it_should_behave_like 'a command method'
  end
end
