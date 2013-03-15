require 'spec_helper'

describe JS::Node::Literal::Composed::Array, '.constant' do
  let(:object) { described_class }

  subject { object.construct(input) }

  context 'with empty input' do
    let(:input) { [] }

    it { should eql(described_class.new([])) }
  end

  context 'with scalar values as input' do
    let(:input) { [1, 2] }

    it 'should return correct ast' do
      should eql(described_class.new([
        JS::Node::Literal::Primitive::Number.new(1),
        JS::Node::Literal::Primitive::Number.new(2)
      ]))
    end

  end

  context 'with nested scalar values as input' do
    let(:input) { [1, [2] ] }

    it 'should return correct ast' do
      should eql(described_class.new([
        JS::Node::Literal::Primitive::Number.new(1),
        JS::Node::Literal::Composed::Array.construct([2])
      ]))
    end
  end

end
