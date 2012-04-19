require 'spec_helper'

describe Haml::Sprockets::Template do
  describe 'evaluate' do
    def process(data)
      described_class.new { data }.render
    end

    describe 'string escaping' do
      before do
        Rails = double('Rails', :root => '/some/dir')
        File.stub(:read)
        @context = double('context')
        ExecJS.stub(:compile).and_return(@context)
      end

      it 'should leave clean string alone' do
        @context.should_receive(:eval).with(/'test'/)
        process(%{test})
      end

      it 'should leave double quotes alone' do
        @context.should_receive(:eval).with(/'test "test"'/)
        process(%{test "test"})
      end

      it 'should double escape characters' do
        @context.should_receive(:eval).with(/'test\\ntest'/)
        process(%{test\ntest})
      end

      it 'should double escape single quotes' do
        @context.should_receive(:eval).with(/'test \\'test\\''/)
        process(%{test 'test'})
      end

      after do
        Object.send(:remove_const, 'Rails')
      end
    end
  end
end

