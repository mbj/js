require 'spec_helper'

describe JS::Node::Literal, '.build' do
  let(:object) { described_class }

  subject { object.build(input) }

  context 'string' do
    let(:input) { 'foo' }
    it { should eql(JS::Node::Literal::Primitive::String.new('foo')) }
  end

  context 'number' do

    context 'fixnum' do
      let(:input) { 1 }
      it { should eql(JS::Node::Literal::Primitive::Number.new(1)) }
    end

    context 'float' do
      let(:input) { 1.0 }
      it { should eql(JS::Node::Literal::Primitive::Number.new(1.0)) }
    end

  end

  context 'singleton' do

    context 'nil' do
      let(:input) { nil }
      it { should be(JS::Node::Literal::Singleton::NULL) }
    end

    context 'true' do
      let(:input) { true }
      it { should be(JS::Node::Literal::Singleton::TRUE) }
    end

    context 'false' do
      let(:input) { false }
      it { should be(JS::Node::Literal::Singleton::FALSE) }
    end

  end

  context 'array' do

    context 'empty' do
      let(:input) { [] }
      it { should eql(JS::Node::Literal::Composed::Array.new([])) }
    end

    context 'plain' do
      context 'homogen' do
        let(:input) { [1, 2] }
        it do 
          should eql(JS::Node::Literal::Composed::Array.new([
            JS::Node::Literal::Primitive::Number.new(1),
            JS::Node::Literal::Primitive::Number.new(2)
          ]))
        end
      end

      context 'heterogen' do
        let(:input) { [1, false] }

        specify do 
          should eql(JS::Node::Literal::Composed::Array.new([
            JS::Node::Literal::Primitive::Number.new(1),
            JS::Node::Literal::Singleton::FALSE
          ]))
        end
      end
    end

    context 'nested' do
      let(:input) { [[1]] }

      specify do
        should eql(JS::Node::Literal::Composed::Array.new([
          JS::Node::Literal::Composed::Array.new([
            JS::Node::Literal::Primitive::Number.new(1)
          ])
        ]))
      end
    end
  end

  context 'hash' do

    context 'empty' do
      let(:input) { {} }

      it { should eql(JS::Node::Literal::Composed::Document.new([])) }
    end

    context 'plain' do
      let(:input) { { 1 => 2 } }

      specify do 
        should eql(JS::Node::Literal::Composed::Document.new([
          JS::Node::Literal::Composed::Document::Attribute.new(
            JS::Node::Literal::Primitive::Number.new(1),
            JS::Node::Literal::Primitive::Number.new(2)
          )
        ]))
      end
    end

    context 'nested' do
      let(:input) { { 0 => { 1 => 2 } } }

      specify do 
        inner = JS::Node::Literal::Composed::Document.new([
          JS::Node::Literal::Composed::Document::Attribute.new(
            JS::Node::Literal::Primitive::Number.new(1),
            JS::Node::Literal::Primitive::Number.new(2)
          )
        ])

        should eql(JS::Node::Literal::Composed::Document.new([
          JS::Node::Literal::Composed::Document::Attribute.new(
            JS::Node::Literal::Primitive::Number.new(0),
            inner
          )
        ]))
      end
    end
  end

  context 'unhandled' do
    let(:input) { :foo }

    it 'should raise error' do
      expect { subject }.to raise_error(RuntimeError, 'No support for literal Symbol')
    end
  end

end
