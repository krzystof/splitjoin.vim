require 'spec_helper'

describe "functions" do
  let(:filename) { 'functions.rb' }

  before :each do
    vim.set(:expandtab)
    vim.set(:shiftwidth, 2)
  end

  describe "GetFirstParam" do
    specify "one parameter" do
      set_file_contents <<-EOF
        function_call(something)
      EOF
      result = vim.echo('sj#GetFirstParams()')
      expect(result).to eq('something')
    end

    specify "two parameters" do
      set_file_contents <<-EOF
        function_call(something, else)
      EOF
      result = vim.echo('sj#GetFirstParams()')
      expect(result).to eq('something')
    end

    specify "nested function call" do
      set_file_contents <<-EOF
        function_call(something(), else)
      EOF
      result = vim.echo('sj#GetFirstParams()')
      expect(result).to eq('something()')
    end

    specify "nested function call with two params" do
      set_file_contents <<-EOF
        function_call(something(more, nested), else)
      EOF
      result = vim.echo('sj#GetFirstParams()')
      expect(result).to eq('something(more, nested)')
    end

    specify "nested function call with two params" do
      set_file_contents <<-EOF
        function_call(something(more(insanely()), nested()), else)
      EOF
      result = vim.echo('sj#GetFirstParams()')
      expect(result).to eq('something(more(insanely()), nested())')
    end
  end
end
