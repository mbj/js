module JSHelper
  def compress_js(string)
    string.gsub(/^[ ]*/, '').split("\n").join(' ')
  end

  def expect_js(string)
    expected_js = compress_js(string)
    subject { object.js }
    it_should_behave_like 'an idempotent method'
    it { should eql(expected_js) }
  end
end
