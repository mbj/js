require 'spec_helper'

describe JS, '.literal_node' do
  let(:object) { described_class }

  subject { object.literal_node(value) }

  let(:value)  { mock('Value') }
  let(:result) { mock('Result') }

  it 'should forward to AQL::Node::Literal.build' do
    JS::Node::Literal.should_receive(:build).with(value).and_return(result)
    should be(result)
  end
end
