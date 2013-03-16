require 'spec_helper'

describe JS::Buffer, '#body' do
  let(:object) { described_class.new }

  subject { object.body(body) }

  let(:body) { JS.name_node(:foo) }
  its(:content) { should eql(' { foo }') }

  it_should_behave_like 'a command method'
end
