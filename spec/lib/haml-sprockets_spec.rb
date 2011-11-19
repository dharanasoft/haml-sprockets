require 'spec_helper'

describe Haml::Sprockets::Template do
  describe 'evaluate' do
    def process(data)
      described_class.new { data }.render
    end

    it 'should escape the string correctly' do
      process(%{test}).should include(%{Haml('test'})
      process(%{test "test"}).should include(%{Haml('test "test"'})
      process(%{test\ntest}).should include(%{Haml('test\\ntest'})
      process(%{test 'test'}).should include(%{Haml('test \\'test\\''})
    end
  end
end

