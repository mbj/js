shared_examples_for 'Node#js' do
  subject { object.js }

  it { should eql(expected_js) }
  its(:frozen?) { should be(true) }
  it_should_behave_like 'an idempotent method'
end
